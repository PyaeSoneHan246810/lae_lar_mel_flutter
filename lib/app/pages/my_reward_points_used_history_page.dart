import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class MyRewardPointsUsedHistoryPage extends StatefulWidget {
  const MyRewardPointsUsedHistoryPage({super.key});

  @override
  State<MyRewardPointsUsedHistoryPage> createState() =>
      _MyRewardPointsUsedHistoryPageState();
}

class _MyRewardPointsUsedHistoryPageState
    extends State<MyRewardPointsUsedHistoryPage> {
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
