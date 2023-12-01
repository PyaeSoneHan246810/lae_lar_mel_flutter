import 'package:lae_lar_mel_app/app/models/mini_games_quiz_option_model.dart';

class MiniGamesQuizQuestion {
  final String title;
  final String image;
  final List<MiniGamesQuizOption> options;
  bool isLocked;
  MiniGamesQuizOption? selectedOption;
  MiniGamesQuizQuestion({
    required this.title,
    required this.image,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
  void reset() {
    selectedOption = null;
    isLocked = false;
  }
}
