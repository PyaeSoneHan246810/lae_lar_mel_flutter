import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../enums/enums.dart';

class CustomCourseView extends StatefulWidget {
  final CourseType courseType;
  final String courseImage;
  final String courseName;
  final double coursePriceInMMK;
  final String courseInstructorName;
  final String courseLanguageCategory;
  final String courseLevel;
  final String courseSkill;
  final bool isHeroAnimationEnabled;
  final Function()? onTap;
  const CustomCourseView({
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
    required this.isHeroAnimationEnabled,
  });

  @override
  State<CustomCourseView> createState() => _CustomCourseViewState();
}

class _CustomCourseViewState extends State<CustomCourseView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isHeroAnimationEnabled
              ? Hero(
                  tag: 'courseImage${widget.courseImage}',
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: const BoxDecoration(
                      color: AppColor.pureWhiteColor,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.courseImage,
                          fit: BoxFit.cover,
                        )),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: AppColor.pureWhiteColor,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.courseImage,
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
                      widget.courseName,
                      style: AppFontStyle.subtitleOffBlack,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    widget.courseType == CourseType.free
                        ? AppLocalizations.of(context)!.free
                        : '${widget.coursePriceInMMK.toStringAsFixed(0)} ${AppLocalizations.of(context)!.mmk}',
                    style: AppFontStyle.captionMediumOffBlack,
                  ),
                ],
              )),
          Text(
            widget.courseInstructorName,
            style: AppFontStyle.bodyOffBlack,
          ),
          Row(
            children: [
              Text(
                widget.courseLanguageCategory,
                style: AppFontStyle.bodyNavTextPrimary,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Text('|'),
              ),
              Text(
                widget.courseLevel,
                style: AppFontStyle.bodyNavTextPrimary,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Text('|'),
              ),
              Text(
                widget.courseSkill,
                style: AppFontStyle.bodyNavTextPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
