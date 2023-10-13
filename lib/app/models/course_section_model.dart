import 'course_material_model.dart';

class CourseSection {
  int courseSectionId;
  String courseSectionTitle;
  List<CourseMaterial> courseMaterials;
  CourseSection({
    required this.courseSectionId,
    required this.courseSectionTitle,
    required this.courseMaterials,
  });
}
