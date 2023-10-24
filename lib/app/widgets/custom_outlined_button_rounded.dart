import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';

class CustomOutlinedButtonRounded extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const CustomOutlinedButtonRounded({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColor.primaryColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        text,
        style: AppFontStyle.buttonNavTextOffBlack(context),
      ),
    );
  }
}
