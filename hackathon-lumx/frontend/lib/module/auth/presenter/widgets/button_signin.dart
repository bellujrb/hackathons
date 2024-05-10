import 'package:flutter/material.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class ButtonSignIn extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback callback;
  const ButtonSignIn({
    super.key,
    required this.img,
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
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.onSecondary,
              width: 2
            ),
            borderRadius: BorderRadius.circular(80)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Image.asset('assets/img/$img'),
            ),
            const SizedBox(width: 20,),
            Text(
              title,
              style: context.appTextStyles.smallWhite,
            ),
          ],
        ),
      ),
    );
  }
}
