import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_courses_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/course_model.dart';

class ViewAllCoursesPage extends StatefulWidget {
  final List<Course> courses;
  final String courseType;
  const ViewAllCoursesPage({
    super.key,
    required this.courses,
    required this.courseType,
  });

  @override
  State<ViewAllCoursesPage> createState() => _ViewAllCoursesPageState();
}

class _ViewAllCoursesPageState extends State<ViewAllCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: (widget.courseType == "free")
            ? AppLocalizations.of(context)!.free_courses_title
            : AppLocalizations.of(context)!.premium_courses_title,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: FadeInDown(
          child: CoursesListView(
            courses: widget.courses,
            displayItemCount: widget.courses.length,
            isHeroAnimationEnabled: false,
          ),
        ),
      ),
    );
  }
}
