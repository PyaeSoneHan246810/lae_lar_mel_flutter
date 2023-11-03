import 'package:lae_lar_mel_app/app/models/quiz_option_model.dart';

class QuizQuestion {
  final String title;
  final List<QuizOption> options;
  bool isLocked;
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
