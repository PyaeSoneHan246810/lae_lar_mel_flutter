import 'package:flutter/foundation.dart';

class RewardPointsProvider extends ChangeNotifier {
  int _rewardPoints = 0;

  int get rewardPoints => _rewardPoints;

  void addPoints(int points) {
    _rewardPoints += points;
    notifyListeners();
  }

  void subtractPoints(int points) {
    _rewardPoints -= points;
    notifyListeners();
  }
}
