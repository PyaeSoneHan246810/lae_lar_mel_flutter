import 'package:hive/hive.dart';

part 'course_instructor_model.g.dart';

@HiveType(typeId: 2)
class CourseInstructor {
  @HiveField(0)
  int courseInstructorId;
  @HiveField(1)
  String courseInstructorName;
  @HiveField(2)
  String courseInstructorImage;
  @HiveField(3)
  String courseInstructorMajor;
  @HiveField(4)
  String courseInstructorDescription;
  CourseInstructor({
    required this.courseInstructorId,
    required this.courseInstructorName,
    required this.courseInstructorImage,
    required this.courseInstructorMajor,
    required this.courseInstructorDescription,
  });
}
