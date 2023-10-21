import 'package:lae_lar_mel_app/app/enums/enums.dart';
import 'package:hive/hive.dart';

part 'course_material_model.g.dart';

@HiveType(typeId: 4)
class CourseMaterial {
  @HiveField(0)
  int courseMaterialId;
  @HiveField(1)
  CourseMaterialType courseMaterialType;
  @HiveField(2)
  String courseMaterialTitle;
  @HiveField(3)
  double? durationInMinute;
  @HiveField(4)
  dynamic content;
  CourseMaterial({
    required this.courseMaterialId,
    required this.courseMaterialType,
    required this.courseMaterialTitle,
    this.durationInMinute,
    this.content,
  });
}
