import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  final Function()? onBackButtonPressed;

  CustomAppBar({
    required this.titleText,
    this.onBackButtonPressed,
    Key? key,
  }) : super(
          key: key,
          backgroundColor: AppColor.pureWhiteColor,
          elevation: 2,
          toolbarHeight: 60,
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              titleText,
              style: AppFontStyle.headerPrimary,
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: onBackButtonPressed,
                icon: const Icon(
                  Icons.favorite,
                  size: 28,
                  color: AppColor.lightBlackColor,
                ),
              ),
            )
          ],
        );
}
