import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final Key? keyField;
  final bool? secureText;
  final int? numbersMax;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String title;
  final TextInputType type;
  final String label;
  const Input({
    Key? key,
    required this.title,
    required this.label,
    required this.type,
    this.keyField,
    this.secureText,
    this.numbersMax,
    this.controller,
    this.validation,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 70,
            width: 350,
            child: TextFormField(
              key: widget.keyField,
              keyboardType: widget.type,
              maxLength: widget.numbersMax,
              obscureText: widget.secureText ?? false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: widget.label,
              ),
              controller: widget.controller,
              validator: widget.validation,
            ),
          )
        ],
      );
  }
}