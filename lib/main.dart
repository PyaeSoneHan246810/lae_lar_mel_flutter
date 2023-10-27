import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lae_lar_mel_app/app/models/course_instructor_model.dart';
import 'package:lae_lar_mel_app/app/models/course_material_model.dart';
import 'package:lae_lar_mel_app/app/models/course_model.dart';
import 'package:lae_lar_mel_app/app/models/course_section_model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'app/providers/theme_mode_provider.dart';
import 'boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(CourseAdapter());
  Hive.registerAdapter(CourseInstructorAdapter());
  Hive.registerAdapter(CourseSectionAdapter());
  Hive.registerAdapter(CourseMaterialAdapter());
  boxCourses = await Hive.openBox<Course>('courseBox');
  runApp(
    ChangeNotifierProvider<ThemeModeProvider>(
      create: (_) => ThemeModeProvider(),
      child: const App(),
    ),
  );
}
