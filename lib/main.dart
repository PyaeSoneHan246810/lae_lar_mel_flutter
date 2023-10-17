import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lae_lar_mel_app/app/enums/enums.dart';
import 'package:lae_lar_mel_app/app/models/course_material_model.dart';
import 'package:lae_lar_mel_app/app/models/course_model.dart';
import 'package:lae_lar_mel_app/app/models/course_section_model.dart';

import 'boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CourseAdapter());
  Hive.registerAdapter(CourseSectionAdapter());
  Hive.registerAdapter(CourseMaterialAdapter());
  Hive.registerAdapter(CourseTypeAdapter());
  Hive.registerAdapter(CourseMaterialTypeAdapter());
  boxCourses = await Hive.openBox<Course>('courseBox');
  runApp(const App());
}
