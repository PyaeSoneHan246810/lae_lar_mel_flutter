import 'package:flutter/material.dart';

import '../config/colors.dart';

class CustomAddToWishlistButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData iconData;
  const CustomAddToWishlistButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.pureWhiteColor,
      textColor: AppColor.offBlackColor,
      elevation: 0,
      highlightElevation: 0,
      shape: const CircleBorder(
        side: BorderSide(
          color: AppColor.primaryColor,
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Icon(
        iconData,
        size: 24,
      ),
    );
  }
}
