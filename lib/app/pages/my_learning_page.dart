import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import '../config/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_separator.dart';

class MyLearningPage extends StatefulWidget {
  const MyLearningPage({super.key});

  @override
  State<MyLearningPage> createState() => _MyLearningPageState();
}

class _MyLearningPageState extends State<MyLearningPage> {
  final int numberOfCoursesEnrolled = 0;
  final int numberOfCoursesCompleted = 0;
  final int totalMinutesLearnedToday = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'My Learning',
        onBackButtonPressed: () {
          Navigator.pushNamed(context, 'wishlistPage');
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: FadeInDown(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            // (Blue Enrolled Container Box)
                            width: 155,
                            height: 98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.secondaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.fact_check,
                                      size: 30,
                                      color: AppColor.pureWhiteColor,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          numberOfCoursesEnrolled.toString(),
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                        const CustomSeparator(
                                          width: 2,
                                          height: 0,
                                        ),
                                        Text(
                                          (numberOfCoursesEnrolled > 1)
                                              ? 'Courses'
                                              : 'Course',
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "Enrolled",
                                      style: AppFontStyle.bodyPureWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const CustomSeparator(
                            height: 10,
                          ), // to create space between the containers
                          Container(
                            // (Teal Completed Container Box)
                            width: 155,
                            height: 98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.school,
                                      size: 30,
                                      color: AppColor.pureWhiteColor,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          numberOfCoursesCompleted.toString(),
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                        const CustomSeparator(
                                          width: 2,
                                          height: 0,
                                        ),
                                        Text(
                                          (numberOfCoursesCompleted > 1)
                                              ? 'Courses'
                                              : 'Course',
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "Completed",
                                      style: AppFontStyle.bodyPureWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSeparator(
                      width: 10,
                      height: 0,
                    ), // to create space between the containers
                    Container(
                      //(Orange<featuredColor> Learned Today Container Box)
                      width: 155,
                      height: 206,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.featuredColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                totalMinutesLearnedToday.toString(),
                                style: AppFontStyle.hugeText,
                              ),
                            ],
                          ),
                          Row(
                            //This row is for 'alarm icon' and 'minute text'.
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.alarm,
                                size: 30,
                                color: AppColor.pureWhiteColor,
                              ),
                              const CustomSeparator(
                                width: 10,
                                height: 0,
                              ),
                              Text(
                                (totalMinutesLearnedToday > 1)
                                    ? 'Minutes'
                                    : 'Minute',
                                style: AppFontStyle.subtitlePureWhite,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.only(
                              bottom: 25,
                            ),
                            child: Text(
                              "Learned Today",
                              style: AppFontStyle.bodyPureWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const CustomSeparator(
                  height: 38,
                ),
                const Text(
                  "Continue Learning",
                  style:
                      AppFontStyle.title1OffBlack, // Customize the text style
                ),
                const CustomSeparator(
                  height: 28,
                ),
                Center(
                  child: SizedBox(
                    width: 230,
                    height: 170,
                    child: SvgPicture.asset(
                      'assets/images/empty_placeholder.svg',
                    ),
                  ),
                ),
                const CustomSeparator(
                  height: 28,
                ),
                const Text(
                  "You have no ongoing courses. What will you learn first?",
                  style: AppFontStyle.bodyOffBlack,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
