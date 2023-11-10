import 'package:hive/hive.dart';

part 'quiz_option_model.g.dart';

@HiveType(typeId: 6)
class QuizOption {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final bool isCorrect;
  QuizOption({
    required this.text,
    required this.isCorrect,
  });
}
