import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/models/mini_games_quiz_option_model.dart';
import 'package:lae_lar_mel_app/app/models/mini_games_quiz_question_model.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/pages/mini_games_quiz_result_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_separator.dart';

class MiniGamesQuizPage extends StatefulWidget {
  final List<MiniGamesQuizQuestion> questions;
  const MiniGamesQuizPage({
    super.key,
    required this.questions,
  });

  @override
  State<MiniGamesQuizPage> createState() => _MiniGamesQuizPageState();
}

class _MiniGamesQuizPageState extends State<MiniGamesQuizPage> {
  late PageController _pageController;
  int _questionNumber = 1;
  int _score = 0;
  double _progressPercent = 0.0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Back",
        textStyle: AppFontStyle.title2OffBlack(context),
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FadeInLeft(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        lineHeight: 30,
                        percent: _progressPercent,
                        backgroundColor:
                            themeModeProvider.themeMode == ThemeMode.light
                                ? AppColor.greyColor
                                : AppColor.darkGreyLight2,
                        progressColor: AppColor.orangeColor,
                        barRadius: const Radius.circular(100),
                        padding: const EdgeInsets.only(right: 12),
                        trailing: Icon(
                          Icons.flag_rounded,
                          color: themeModeProvider.themeMode == ThemeMode.light
                              ? AppColor.offBlackColor
                              : AppColor.pureWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomSeparator(
                  width: 0,
                  height: 30,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: _questionNumber < widget.questions.length
                        ? const NeverScrollableScrollPhysics()
                        : const AlwaysScrollableScrollPhysics(),
                    itemCount: widget.questions.length,
                    itemBuilder: (context, index) {
                      final question = widget.questions[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.title,
                              style: AppFontStyle.title2OffBlack(context),
                            ),
                            const CustomSeparator(
                              width: 0,
                              height: 20,
                            ),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  question.image,
                                  width: 220,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const CustomSeparator(
                              width: 0,
                              height: 20,
                            ),
                            Expanded(
                              child: Column(
                                children: question.options.map((option) {
                                  final color =
                                      getColorForOption(question, option);
                                  return GestureDetector(
                                    onTap: () {
                                      if (question.isLocked) {
                                        return;
                                      } else {
                                        setState(() {
                                          question.isLocked = true;
                                          question.selectedOption = option;
                                        });
                                        if (question
                                            .selectedOption!.isCorrect) {
                                          _score++;
                                        }
                                      }
                                      _progressPercent = _questionNumber /
                                          widget.questions.length;
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Result",
                                                  style: AppFontStyle
                                                      .alertTitleOffBlack(
                                                          context),
                                                ),
                                                content: Text(
                                                  "Your answer is ${question.selectedOption!.isCorrect ? 'correct' : 'incorrect'}!",
                                                  style: AppFontStyle
                                                      .alertTextOffBlack(
                                                          context),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      if (_questionNumber <
                                                          widget.questions
                                                              .length) {
                                                        _pageController
                                                            .nextPage(
                                                          duration:
                                                              const Duration(
                                                            milliseconds: 250,
                                                          ),
                                                          curve:
                                                              Curves.easeInExpo,
                                                        );
                                                        setState(() {
                                                          _questionNumber++;
                                                        });
                                                      } else {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                MiniGamesQuizResultPage(
                                                              score: _score,
                                                              totalNumberOfQuestions:
                                                                  widget
                                                                      .questions
                                                                      .length,
                                                              questions: widget
                                                                  .questions,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Text(
                                                      _questionNumber <
                                                              widget.questions
                                                                  .length
                                                          ? 'Next Question'
                                                          : 'See Result',
                                                      style: AppFontStyle
                                                          .navTextPrimary,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      decoration: BoxDecoration(
                                        color: themeModeProvider.themeMode ==
                                                ThemeMode.light
                                            ? AppColor.greyColor
                                            : AppColor.darkGreyLight2,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: color,
                                          width: 1.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              option.text,
                                              style: AppFontStyle
                                                  .captionBigOffBlack(
                                                context,
                                              ),
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          getIconForOption(question, option),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColorForOption(
      MiniGamesQuizQuestion question, MiniGamesQuizOption option) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? AppColor.primaryColor : Colors.red;
      } else if (option.isCorrect) {
        return AppColor.primaryColor;
      }
    }
    return Colors.transparent;
  }

  Widget getIconForOption(
      MiniGamesQuizQuestion question, MiniGamesQuizOption option) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(
                Icons.check_circle_rounded,
                color: AppColor.primaryColor,
              )
            : const Icon(
                Icons.cancel_rounded,
                color: Colors.red,
              );
      } else if (option.isCorrect) {
        return const Icon(
          Icons.check_circle_rounded,
          color: AppColor.primaryColor,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
