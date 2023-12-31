import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../providers/theme_mode_provider.dart';

class CustomCourseViewWithDeleteButton extends StatelessWidget {
  final String courseType;
  final String courseImage;
  final String courseName;
  final double coursePriceInMMK;
  final String courseInstructorName;
  final String courseLanguageCategory;
  final String courseLevel;
  final String courseSkill;
  final Function()? onTap;
  final Function()? onDeleteIconButtonTap;
  const CustomCourseViewWithDeleteButton({
    super.key,
    required this.courseType,
    required this.courseImage,
    required this.courseName,
    required this.coursePriceInMMK,
    required this.courseInstructorName,
    required this.courseLanguageCategory,
    required this.courseLevel,
    required this.courseSkill,
    required this.onTap,
    required this.onDeleteIconButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: const BoxDecoration(
              color: AppColor.pureWhiteColor,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: courseImage,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240,
                    child: Text(
                      courseName,
                      style: AppFontStyle.subtitleOffBlack(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    courseType == "free"
                        ? AppLocalizations.of(context)!.free
                        : '${coursePriceInMMK.toStringAsFixed(0)} ${AppLocalizations.of(context)!.mmk}',
                    style: AppFontStyle.captionMediumOffBlack(context),
                  ),
                ],
              )),
          Text(
            courseInstructorName,
            style: AppFontStyle.bodyOffBlack(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    courseLanguageCategory,
                    style: AppFontStyle.bodyNavTextPrimary,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Text('|'),
                  ),
                  Text(
                    courseLevel,
                    style: AppFontStyle.bodyNavTextPrimary,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Text('|'),
                  ),
                  Text(
                    courseSkill,
                    style: AppFontStyle.bodyNavTextPrimary,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeModeProvider.themeMode == ThemeMode.light
                      ? AppColor.pureWhiteColor
                      : AppColor.darkGreyLight2,
                ),
                child: IconButton(
                  onPressed: onDeleteIconButtonTap,
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
