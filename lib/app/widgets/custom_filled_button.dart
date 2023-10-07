import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class CustomFilledButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const CustomFilledButton({
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
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            elevation: 0, // Set elevation to 0 to remove the default elevation
            highlightElevation:
                0, // Set highlightElevation to 0 to remove elevation on press
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
