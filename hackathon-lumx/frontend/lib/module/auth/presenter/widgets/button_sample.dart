import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class ButtonSample extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const ButtonSample({
    super.key,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: 64,
        width: context.mediaWidth * 0.9,
        decoration: BoxDecoration(
            color: AppColors.onPrimary,
            borderRadius: BorderRadius.circular(80)),
        child: Text(
          title,
          style: context.appTextStyles.smallWhite,
        ),
      ),
    );
  }
}
