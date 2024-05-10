import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/text_style.dart';

class InputConvert extends StatefulWidget {
  final String title;
  const InputConvert({super.key, required this.title});

  @override
  State<InputConvert> createState() => _InputConvertState();
}

class _InputConvertState extends State<InputConvert> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: context.appTextStyles.miniSmallGray,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: context.mediaWidth * 0.9,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: ShapeDecoration(
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 1, color: Color(0xFF8859FE)), // Border color
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 4,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: const InputDecoration(
                    hintText: 'Amount',
                    hintStyle: TextStyle(color: Colors.white54),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: InputBorder.none,
                    fillColor: Color(0xFF1E1E1E),
                    filled: true,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFF1E1E1E),
                  ),
                  dropdownColor: const Color(0xFF2C2C2C),
                  value: 'FDZ',
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  iconSize: 24,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  onChanged: (String? newValue) {},
                  items: <String>['FDZ', 'BURGER']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Image.asset('assets/img/logo-clean.png',
                              width: 24, height: 24),
                          const SizedBox(width: 5),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
