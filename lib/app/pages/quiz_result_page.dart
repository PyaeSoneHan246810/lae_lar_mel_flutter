import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/pages/quiz_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import '../config/colors.dart';
import '../models/quiz_question_model.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class QuizResultPage extends StatefulWidget {
  final int score;
  final int totalNumberOfQuestions;
  final List<QuizQuestion> questions;
  const QuizResultPage({
    super.key,
    required this.score,
    required this.totalNumberOfQuestions,
    required this.questions,
  });

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  String getResultMessage() {
    double percentage = widget.score / widget.totalNumberOfQuestions * 100;
    if (percentage >= 90) {
      return "Excellent!";
    } else if (percentage >= 80) {
      return "Great Job!";
    } else if (percentage >= 70) {
      return "Well Done!";
    } else if (percentage >= 60) {
      return "Good Job!";
    } else {
      return "You Did Your Best!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Quiz Result",
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              child: Center(
                child: Text(
                  getResultMessage(),
                  style: AppFontStyle.headerPrimary,
                ),
              ),
            ),
            ZoomIn(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "You have scored ${widget.score} out of ${widget.totalNumberOfQuestions}.",
                    style: AppFontStyle.title3OffBlack(context),
                  ),
                  Positioned(
                    child: Lottie.asset(
                      'assets/animations/congratulations_animation.json',
                      height: 80,
                      repeat: false,
                    ),
                  )
                ],
              ),
            ),
            ZoomIn(
              child: SvgPicture.asset(
                'assets/images/celebrating_illustration.svg',
                width: double.infinity,
                height: 300,
              ),
            ),
            const CustomSeparator(
              height: 36,
            ),
            SlideInUp(
              child: ElevatedButton(
                onPressed: () {
                  for (var question in widget.questions) {
                    question.reset();
                  }
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        questions: widget.questions,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColor.primaryColor,
                  ), // Customize the button style
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                ),
                child: const Text(
                  'Try again',
                  style: AppFontStyle.buttonNavTextPureWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
