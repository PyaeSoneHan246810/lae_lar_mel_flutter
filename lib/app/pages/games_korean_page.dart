import 'package:flutter/material.dart';

import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class KoreanGamesPage extends StatefulWidget {
  const KoreanGamesPage({super.key});

  @override
  State<KoreanGamesPage> createState() => _KoreanGamesPageState();
}

class _KoreanGamesPageState extends State<KoreanGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Korean Quiz Games",
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
