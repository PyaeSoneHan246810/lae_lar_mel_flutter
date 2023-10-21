import 'course_material_model.dart';
import 'package:hive/hive.dart';

part 'course_section_model.g.dart';

@HiveType(typeId: 3)
class CourseSection {
  @HiveField(0)
  int courseSectionId;
  @HiveField(1)
  String courseSectionTitle;
  @HiveField(2)
  List<CourseMaterial> courseMaterials;
  CourseSection({
    required this.courseSectionId,
    required this.courseSectionTitle,
    required this.courseMaterials,
  });
}
