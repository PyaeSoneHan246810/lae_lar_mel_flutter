import 'package:lae_lar_mel_app/app/models/quiz_option_model.dart';
import 'package:hive/hive.dart';

part 'quiz_question_model.g.dart';

@HiveType(typeId: 5)
class QuizQuestion {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<QuizOption> options;
  @HiveField(2)
  bool isLocked;
  @HiveField(3)
  QuizOption? selectedOption;
  QuizQuestion({
    required this.title,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
  void reset() {
    selectedOption = null;
    isLocked = false;
  }
}
