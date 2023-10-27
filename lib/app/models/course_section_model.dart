import 'course_material_model.dart';
import 'package:hive/hive.dart';

part 'course_section_model.g.dart';

@HiveType(typeId: 3)
class CourseSection {
  @HiveField(0)
  String courseSectionTitle;
  @HiveField(1)
  List<CourseMaterial> courseMaterials;
  CourseSection({
    required this.courseSectionTitle,
    required this.courseMaterials,
  });
}
