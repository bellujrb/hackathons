import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class InputEmail extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const InputEmail({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;
    return Container(
        width: context.mediaWidth * 0.9,
        height: 64,
        decoration: ShapeDecoration(
          color: AppColors.backgroundInput,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF8859FE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: TextFormField(
          controller: widget.controller,
          style: styleModifier.smallWhite,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(24),
            hintText: widget.title,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            border: InputBorder.none,
            fillColor: AppColors.secondary,
          ),
        ));
  }
}
