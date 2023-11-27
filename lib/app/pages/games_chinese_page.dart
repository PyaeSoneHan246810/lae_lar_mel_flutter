import 'package:flutter/material.dart';

import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class ChineseGamesPage extends StatefulWidget {
  const ChineseGamesPage({super.key});

  @override
  State<ChineseGamesPage> createState() => _ChineseGamesPageState();
}

class _ChineseGamesPageState extends State<ChineseGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Chinese Quiz Games",
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
