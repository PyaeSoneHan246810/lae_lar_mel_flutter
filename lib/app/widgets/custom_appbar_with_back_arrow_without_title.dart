import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class CustomAppBarWithBackArrowWithoutTitle extends AppBar {
  final Function()? onBackButtonPressed;

  CustomAppBarWithBackArrowWithoutTitle({
    this.onBackButtonPressed,
    Key? key,
  }) : super(
          key: key,
          backgroundColor: AppColor.pureWhiteColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              onPressed: onBackButtonPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColor.offBlackColor,
              ),
            ),
          ),
        );
}
