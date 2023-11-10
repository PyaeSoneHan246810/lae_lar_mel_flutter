import 'package:hive/hive.dart';

part 'course_instructor_model.g.dart';

@HiveType(typeId: 2)
class CourseInstructor {
  @HiveField(0)
  String courseInstructorName;
  @HiveField(1)
  String courseInstructorImage;
  @HiveField(2)
  String courseInstructorMajor;
  @HiveField(3)
  String courseInstructorDescription;
  @HiveField(4)
  String courseInstructorCityAddress;
  CourseInstructor({
    required this.courseInstructorName,
    required this.courseInstructorImage,
    required this.courseInstructorMajor,
    required this.courseInstructorDescription,
    required this.courseInstructorCityAddress,
  });
}
