import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';

import '../widgets/custom_back_button.dart';

class MiniGamesQuizPage extends StatefulWidget {
  const MiniGamesQuizPage({super.key});

  @override
  State<MiniGamesQuizPage> createState() => _MiniGamesQuizPageState();
}

class _MiniGamesQuizPageState extends State<MiniGamesQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomBackButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
