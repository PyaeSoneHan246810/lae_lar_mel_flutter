import 'package:flutter/material.dart';

class CustomAppBarWithBackArrowWithoutTitle extends AppBar {
  final Color appBarBackgroundColor;
  final Color appBarBackArrowColor;
  final Function()? onBackButtonPressed;

  CustomAppBarWithBackArrowWithoutTitle({
    required this.appBarBackgroundColor,
    required this.appBarBackArrowColor,
    this.onBackButtonPressed,
    Key? key,
  }) : super(
          key: key,
          elevation: 0,
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
