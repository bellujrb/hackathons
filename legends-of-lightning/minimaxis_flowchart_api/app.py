from flask import Flask, request, jsonify
import re
from sympy import symbols, simplify, And, Or, printing
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


def miniscript_to_sympy(miniscript):
    """Transform miniscript into a symbolic expression so it can simplified."""
    if unbalanced_parentheses(miniscript):
        raise KeyError("Missing parenthesis")
    miniscript = miniscript.replace(' ', '')
    valid_functions = ['pk', 'after', 'older', 'sha256', 'hash256', 'ripemd160', 'hash160', 'and', 'or', 'thresh']
    function_match = re.match(r'(\w+)\((.*)\)', miniscript)
    if function_match:
        function_name = function_match.group(1)

        if function_name not in valid_functions:
            raise ValueError(f"Invalid function: {function_name}")
        function_args_str = function_match.group(2)
        function_args = split_at_commas_outside_parentheses(function_args_str)

        if function_name in ['and', 'or']:
            if len(function_args) != 2:
                raise ValueError(f"Invalid number of arguments for {function_name}: {len(function_args)}")
            left = miniscript_to_sympy(function_args[0])
            right = miniscript_to_sympy(function_args[1])
            return And(left, right) if function_name == 'and' else Or(left, right)

        elif function_name == 'thresh':
            threshold = int(function_args[0])
            rest_args = function_args[1:]
            # Equivalent to or
            if threshold == 1:
                args = [miniscript_to_sympy(arg) for arg in rest_args]
                return Or(*args)
            # Equivalent to and
            elif threshold == len(rest_args):
                args = [miniscript_to_sympy(arg) for arg in rest_args]
                return And(*args)
            # Not simplifiable
            else:
                keys = [miniscript_to_sympy(arg) for arg in function_args[1:]]
                return (threshold, keys)

        elif function_name in ['pk', 'after', 'older', 'sha256', 'hash256', 'ripemd160', 'hash160', 'thresh']:
            return symbols(f"{function_name}.{function_args[0]}")

        else:
            raise ValueError(f"Unsupported function: {function_name}")
    else:
        return symbols(miniscript)


def transform_policy(expression):
    '''Make every and and or back to thresh, so it is easier to visualize in the flowchart'''
    if isinstance(expression, list):
        function = expression[0]
        args = expression[1:]
        if function == 'and':
            return ['thresh', len(args)] + [transform_policy(arg) for arg in args]
        elif function == 'or':
            return ['thresh', 1] + [transform_policy(arg) for arg in args]
        else:
            return [function] + [transform_policy(arg) for arg in args]
    else:
        return expression


def sympy_to_miniscript(expr):
    expr_str = str(expr)
    return expr_str.replace('&', 'and').replace('|', 'or')


def transform_expression(expr):
    # Find all patterns like 'Tuple(Integer(3), [pk(key_1), pk(key_2), And(older(12960), pk(key_3))])'
    matches = re.findall(r"Tuple\(Integer\((\d+)\), \[(.+)\]\)", expr)

    # For each match, replace it with 'thresh(3,pk(key_1),pk(key_2),and(pk(key_3),older(12960)))'
    for match in matches:
        threshold, keys = match
        keys = keys.split(', ')
        keys_str = ', '.join([f"{key}" for key in keys])
        expr = expr.replace(f"Tuple(Integer({threshold}), [{keys_str}])", f"thresh({threshold}, {keys_str})")

    # Find all patterns like 'Symbol('function_arg')'
    matches = re.findall(r"Symbol\('(.*?)'\)", expr)

    # For each match, replace it with 'function(arg)'
    for match in matches:
        if '.' in match:
            function, arg = match.split('.')
            expr = expr.replace(f"Symbol('{function}.{arg}')", f"{function}({arg})")
        else:
            expr = expr.replace(f"Symbol('{match}')", f"{match}")

    return expr


def simplify_miniscript(miniscript):
    sympy_expr = miniscript_to_sympy(miniscript)
    simplified_sympy_expr = simplify(sympy_expr)
    simplified_miniscript = printing.repr.srepr(simplified_sympy_expr)
    simple_miniscript = transform_expression(simplified_miniscript)
    return simple_miniscript.lower()


def miniscript_to_json(miniscript):
    if unbalanced_parentheses(miniscript):
        raise KeyError("Missing parenthesis")
    miniscript = miniscript.lower().replace(' ', '').replace('(h)', '(H)')
    valid_functions = ['pk', 'after', 'older', 'sha256', 'hash256', 'ripemd160', 'hash160', 'and', 'or', 'thresh',
                       'symbol']
    function_match = re.match(r'(\w+)\((.*)\)', miniscript)
    if function_match:
        function_name = function_match.group(1)

        if function_name not in valid_functions:
            raise ValueError(f"Invalid function: {function_name}")
        function_args_str = function_match.group(2)
        function_args = split_at_commas_outside_parentheses(function_args_str)

        if function_name in ['sha256', 'hash256']:
            h = (function_args[0])
            if len(function_args[0]) != 64 and function_args[0] != 'H':
                raise ValueError(f"Invalid argument for {function_name}: {function_args[0]}")
            return {function_name: [h]}

        elif function_name in ['ripemd160', 'hash160']:
            h = (function_args[0])
            if len(function_args[0]) != 40 and function_args[0] != 'H':
                raise ValueError(f"Invalid argument for {function_name}: {function_args[0]}")
            return {function_name: [h]}

        elif function_name in ['after', 'older']:
            timing = int(function_args[0])
            if int(function_args[0]) == 0:
                raise ValueError(f"Invalid argument for {function_name}: {function_args[0]}")
            return {function_name: [timing]}

        elif function_name == 'thresh':
            num = int(function_args[0])
            if num < 1 or num > len(function_args) - 1:
                raise ValueError(f"Invalid argument for {function_name}: {function_args[0]}")
            subpolicies = [miniscript_to_json(arg) for arg in function_args[1:]]
            return {function_name: {'num': num, 'subpolicies': subpolicies}}

        elif function_name in ['and', 'or']:
            subpolicies = [miniscript_to_json(arg) for arg in function_args]

            return {function_name: subpolicies}

        else:
            return {function_name: [miniscript_to_json(arg) if '(' in arg else arg for arg in function_args]}
    else:
        return miniscript


def split_at_commas_outside_parentheses(s):
    components = []
    bracket_level = 0
    current_component = ""
    for char in s:
        if char == ',' and bracket_level == 0:
            components.append(current_component)
            current_component = ""
        else:
            if char == '(':
                bracket_level += 1
            elif char == ')':
                bracket_level -= 1
            current_component += char
    components.append(current_component)  # add the last component
    return components


def merge_or_nodes(node):
    # Base case: if the node is a leaf node (i.e., it has no children), return the node as is
    if not isinstance(node, dict):
        return node

    # Recursive case: first handle the child nodes
    for key in node:
        node[key] = [merge_or_nodes(child) for child in node[key]]

    # If the node is an 'or' node and one of its children is also an 'or' node,
    # merge the node with its child and convert it to a 'thresh' node
    if isinstance(node, type({})):
        if 'or' in node and (any('or' in child for child in node['or']) or
                             any('thresh' in child and child['thresh']['num'] == 1
                                 for child in node['or'])):
            # Merge the children into a single 'thresh' node
            subpolicies = []
            for child in node['or']:
                if 'or' in child:
                    subpolicies.extend(child['or'])
                elif 'thresh' in child:
                    subpolicies.extend(child['thresh']['subpolicies'])
                else:
                    subpolicies.append(child)

            merged_node = {
                'thresh': {
                    'num': 1,
                    'subpolicies': subpolicies
                }
            }
            return merged_node

        if 'and' in node and (any('and' in child for child in node['and']) or
                              any('thresh' in child and child['thresh']['num'] == len(child['thresh']['subpolicies'])
                                  for child in node['and'])):
            # Merge the children into a single 'thresh' node
            subpolicies = []
            for child in node['and']:
                if 'and' in child:
                    subpolicies.extend(child['and'])
                elif 'thresh' in child:
                    subpolicies.extend(child['thresh']['subpolicies'])
                else:
                    subpolicies.append(child)

            merged_node = {
                'thresh': {
                    'num': len(subpolicies),
                    'subpolicies': subpolicies
                }
            }
            return merged_node

    elif isinstance(node, list):
        for i, item in enumerate(node):
            node[i] = merge_or_nodes(item)
    return node


def json_to_mermaid(json_data, parent=None, depth=0, key_counter={}, min_check=1, tot_check=1):
    """Transform miniscript in json format to mermaid flowchart"""
    key_counter = {} if key_counter is None else key_counter
    mermaid_code = "graph TD;" if depth == 0 else ""
    if isinstance(json_data, dict):
        for key, value in json_data.items():
            if key in key_counter:
                key_counter[key] += 1
            else:
                key_counter[key] = 0
            new_key = f"{key}_{key_counter[key]}"

            if key in ['and', 'or']:
                tot_check = len(value)
                if key == 'and':
                    min_check = tot_check
                elif key == 'or':
                    min_check = 1
                mermaid_code += json_to_mermaid(value, new_key, depth + 1, key_counter=key_counter, min_check=min_check,
                                                tot_check=tot_check)
                if depth:
                    mermaid_code += f"{new_key} --> {parent};"
                mermaid_code += f"{new_key}{{{'Check {}/{}'.format(min_check, tot_check)}}};"

            elif key == 'thresh':
                min_check = value['num']
                tot_check = len(value['subpolicies'])
                for item in value['subpolicies']:
                    mermaid_code += json_to_mermaid(item, new_key, depth + 1, key_counter=key_counter,
                                                    min_check=min_check, tot_check=tot_check)
                if depth:
                    mermaid_code += f"{new_key} --> {parent};"
                mermaid_code += f"{new_key}{{{'Check {}/{}'.format(min_check, tot_check)}}};"

            if key in ['pk', 'older', 'after', 'hash160', 'sha256', 'hash256', 'ripemd160']:
                if tot_check == 1:
                    pass
                mermaid_code += f"{value[0]} -->|{key}| {parent if parent else new_key}{{{'Check {}/{}'.format(min_check, tot_check)}}};"

    elif isinstance(json_data, list):
        for item in json_data:
            mermaid_code += json_to_mermaid(item, parent, depth, key_counter=key_counter, min_check=min_check,
                                            tot_check=tot_check)

    mermaid_code += f"{new_key} -->|yes|s((spend));{new_key} -->|no|n((nothing));" if not depth else ''

    return mermaid_code


def unbalanced_parentheses(s):
    stack = []
    for char in s:
        if char == '(':
            stack.append(char)
        elif char == ')':
            if not stack:
                return False
            stack.pop()
    return not not stack


def miniscript_to_mermaid(miniscript, simp=False):
    """Uses helper functions to go from miniscript to mermaid flowchart with or without simplification."""
    # Removing likeleness while we don't know how to deal with it
    miniscript = re.sub(r'\d+@', '', miniscript)
    if simp:
        miniscript = simplify_miniscript(miniscript)
    json_obj = miniscript_to_json(miniscript)
    return json_to_mermaid(json_obj)


@app.route('/miniscript_to_sympy', methods=['POST'])
def miniscript_to_sympy_api():
    if request.method == 'POST':
        data = request.get_json()
        miniscript = data.get('miniscript')
        try:
            miniscript_result = miniscript_to_mermaid(miniscript, True)

            return jsonify({'miniscript': miniscript, 'result': str(miniscript_result)})
        except ValueError as e:
            return jsonify({'error': str(e)}), 400
    else:
        return jsonify({'error': 'Method Not Allowed'}), 405


if __name__ == '__main__':
    app.run(debug=True)


