import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class CustomFilledButtonRounded extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const CustomFilledButtonRounded({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: onPressed,
            color: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            height: 50,
            elevation: 0,
            highlightElevation: 0,
            child: Text(
              text,
              style: AppFontStyle.buttonNavTextPureWhite,
            ),
          ),
        ),
      ],
    );
  }
}
