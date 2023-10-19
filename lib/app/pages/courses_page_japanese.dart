import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_tabbar.dart';
import '../widgets/custom_courses_tabbar_view.dart';

class JapaneseCoursesPage extends StatefulWidget {
  const JapaneseCoursesPage({super.key});

  @override
  State<JapaneseCoursesPage> createState() => _JapaneseCoursesPageState();
}

class _JapaneseCoursesPageState extends State<JapaneseCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.japanese,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const Column(
          children: [
            CoursesTabBar(
              tab1Label: 'Beginner',
              tab2Label: 'Intermediate',
              tab3Label: 'Advanced',
              tab4Label: 'JLPT',
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CoursesTabBarView(
                    level: 'Beginner',
                    language: 'Japanese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Intermediate',
                    language: 'Japanese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Advanced',
                    language: 'Japanese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'JLPT',
                    language: 'Japanese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
