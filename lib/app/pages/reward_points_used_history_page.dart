import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class RewardPointsUsedHistoryPage extends StatefulWidget {
  const RewardPointsUsedHistoryPage({super.key});

  @override
  State<RewardPointsUsedHistoryPage> createState() =>
      _RewardPointsUsedHistoryPageState();
}

class _RewardPointsUsedHistoryPageState
    extends State<RewardPointsUsedHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.points_used_history,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
