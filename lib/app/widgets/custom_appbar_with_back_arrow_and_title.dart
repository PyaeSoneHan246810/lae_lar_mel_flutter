import 'package:flutter/material.dart';
import '../config/font_styles.dart';

class CustomAppBarWithBackArrowAndTitle extends AppBar {
  final String titleText;
  final TextStyle? textStyle;
  final Function()? onBackButtonPressed;

  CustomAppBarWithBackArrowAndTitle({
    required this.titleText,
    this.textStyle,
    this.onBackButtonPressed,
    Key? key,
  }) : super(
          key: key,
          elevation: 0,
          title: Text(
            titleText,
            style: textStyle ?? AppFontStyle.title2Primary,
          ),
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              onPressed: onBackButtonPressed,
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
              ),
            ),
          ),
        );
}
