import 'package:flutter/material.dart';

import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class JapaneseGamesPage extends StatefulWidget {
  const JapaneseGamesPage({super.key});

  @override
  State<JapaneseGamesPage> createState() => _JapaneseGamesPageState();
}

class _JapaneseGamesPageState extends State<JapaneseGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Japanese Quiz Games",
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
