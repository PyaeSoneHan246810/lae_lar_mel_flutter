import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../enums/enums.dart';

class CourseView extends StatelessWidget {
  final CourseType courseType;
  final String courseImagePath;
  final String courseName;
  final String coursePrice;
  final String courseInstructorName;
  final String courseLanguageCategory;
  final String courseLevel;
  final String courseSkill;
  final Function()? onTap;
  const CourseView({
    super.key,
    required this.courseType,
    required this.courseImagePath,
    required this.courseName,
    required this.coursePrice,
    required this.courseInstructorName,
    required this.courseLanguageCategory,
    required this.courseLevel,
    required this.courseSkill,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                courseImagePath,
                fit: BoxFit.cover,
              ),
            ),
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
                      style: AppFontStyle.subtitleOffBlack,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    coursePrice,
                    style: AppFontStyle.captionMediumOffBlack,
                  )
                ],
              )),
          Text(
            courseInstructorName,
            style: AppFontStyle.bodyOffBlack,
          ),
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
          )
        ],
      ),
    );
  }
}
