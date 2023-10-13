import 'package:flutter/material.dart';

import '../config/colors.dart';

class CustomAddToWishlistButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomAddToWishlistButton({
    super.key,
    required this.onPressed,
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
      child: const Icon(
        Icons.favorite_outline_rounded,
        size: 24,
      ),
    );
  }
}
