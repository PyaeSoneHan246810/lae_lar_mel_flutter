import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnglishGamesPage extends StatefulWidget {
  const EnglishGamesPage({super.key});

  @override
  State<EnglishGamesPage> createState() => _EnglishGamesPageState();
}

class _EnglishGamesPageState extends State<EnglishGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "English Quiz Games",
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
