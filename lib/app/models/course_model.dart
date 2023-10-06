import 'package:lae_lar_mel_app/app/enums/enums.dart';

class CourseModel {
  CourseType courseType;
  String courseImagePath;
  String courseName;
  String coursePrice;
  String courseInstructorName;
  String courseLanguageCategory;
  String courseLevel;
  String courseSkill;
  CourseModel({
    required this.courseType,
    required this.courseImagePath,
    required this.courseName,
    required this.coursePrice,
    required this.courseInstructorName,
    required this.courseLanguageCategory,
    required this.courseLevel,
    required this.courseSkill,
  });
  static List<CourseModel> getFreeCourses() {
    List<CourseModel> freeCourses = [];
    freeCourses.add(
      CourseModel(
        courseType: CourseType.free,
        courseImagePath: 'assets/images/free_course_placeholder1.jpg',
        courseName: 'Basic English Grammar Course',
        coursePrice: 'Free',
        courseInstructorName: 'Tr. Hsu',
        courseLanguageCategory: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Grammar',
      ),
    );
    freeCourses.add(
      CourseModel(
        courseType: CourseType.free,
        courseImagePath: 'assets/images/free_course_placeholder2.jpg',
        courseName: 'Daily English Conversations',
        coursePrice: 'Free',
        courseInstructorName: 'Tr. Phyo',
        courseLanguageCategory: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Speaking',
      ),
    );
    return freeCourses;
  }

  static List<CourseModel> getPremiumCourses() {
    List<CourseModel> premiumCourses = [];
    premiumCourses.add(
      CourseModel(
        courseType: CourseType.premium,
        courseImagePath: 'assets/images/premium_course_placeholder1.jpg',
        courseName: 'Japanese N5 Grammar Course',
        coursePrice: '20000 MMK',
        courseInstructorName: 'Tr. Hnin',
        courseLanguageCategory: 'Japanese',
        courseLevel: 'Beginner',
        courseSkill: 'Grammar',
      ),
    );
    premiumCourses.add(
      CourseModel(
        courseType: CourseType.premium,
        courseImagePath: 'assets/images/premium_course_placeholder2.png',
        courseName: 'Intermediate English Writing Course',
        coursePrice: '50000 MMK',
        courseInstructorName: 'Tr. Naing',
        courseLanguageCategory: 'English',
        courseLevel: 'Intermediate',
        courseSkill: 'Writing',
      ),
    );
    return premiumCourses;
  }
}
