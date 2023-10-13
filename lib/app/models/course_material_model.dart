import 'package:lae_lar_mel_app/app/enums/enums.dart';

class CourseMaterial {
  int courseMaterialId;
  CourseMaterialType courseMaterialType;
  String courseMaterialTitle;
  String? duration;
  CourseMaterial({
    required this.courseMaterialId,
    required this.courseMaterialType,
    required this.courseMaterialTitle,
    this.duration,
  });
}
