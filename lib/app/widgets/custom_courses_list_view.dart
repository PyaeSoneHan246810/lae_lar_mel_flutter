import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../pages/course_details_page.dart';
import 'custom_course_view.dart';
import 'custom_separator.dart';

class CoursesListView extends StatefulWidget {
  final List<Course> courses;
  final int displayItemCount;
  final bool isHeroAnimationEnabled;
  const CoursesListView({
    super.key,
    required this.courses,
    required this.displayItemCount,
    required this.isHeroAnimationEnabled,
  });

  @override
  State<CoursesListView> createState() => _CoursesListViewState();
}

class _CoursesListViewState extends State<CoursesListView> {
  void navigateToCourseDetailsPage(
      BuildContext context, int index, List<Course> courses) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CourseDetailsPage(
        course: courses[index],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.displayItemCount,
      itemBuilder: (context, index) {
        return CustomCourseView(
          courseType: widget.courses[index].courseType,
          courseImage: widget.courses[index].coursePreviewImage,
          courseName: widget.courses[index].courseName,
          coursePriceInMMK: widget.courses[index].coursePriceInMMK,
          courseInstructorName:
              widget.courses[index].courseInstructor.courseInstructorName,
          courseLanguageCategory: widget.courses[index].courseLanguage,
          courseLevel: widget.courses[index].courseLevel,
          courseSkill: widget.courses[index].courseSkill,
          isHeroAnimationEnabled: widget.isHeroAnimationEnabled,
          onTap: () =>
              navigateToCourseDetailsPage(context, index, widget.courses),
        );
      },
      separatorBuilder: (context, index) {
        return const CustomSeparator(height: 15);
      },
    );
  }
}
