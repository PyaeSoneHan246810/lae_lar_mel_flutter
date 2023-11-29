import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class CustomBackButton extends StatelessWidget {
  final Function() onTap;
  const CustomBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColor.offBlackColor,
              size: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Back",
                style: AppFontStyle.title2OffBlack(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
