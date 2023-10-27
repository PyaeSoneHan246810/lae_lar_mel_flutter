import 'package:hive/hive.dart';

part 'course_material_model.g.dart';

@HiveType(typeId: 4)
class CourseMaterial {
  @HiveField(0)
  int courseMaterialId;
  @HiveField(1)
  String courseMaterialTitle;
  @HiveField(2)
  String courseMaterialType;
  @HiveField(3)
  double? durationInMinute;
  @HiveField(4)
  dynamic content;
  CourseMaterial({
    required this.courseMaterialId,
    required this.courseMaterialTitle,
    required this.courseMaterialType,
    this.durationInMinute,
    this.content,
  });
}
