import 'package:hive/hive.dart';

part 'enums.g.dart';

@HiveType(typeId: 4)
enum CourseType {
  @HiveField(0)
  free,
  @HiveField(1)
  premium,
}

@HiveType(typeId: 5)
enum CourseMaterialType {
  @HiveField(0)
  video,
  @HiveField(1)
  document,
  @HiveField(2)
  quiz,
}
