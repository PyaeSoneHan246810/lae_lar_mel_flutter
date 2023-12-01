import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/models/quiz_option_model.dart';
import 'package:lae_lar_mel_app/app/models/quiz_question_model.dart';
import 'package:lae_lar_mel_app/app/pages/quiz_result_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import 'package:animate_do/animate_do.dart';
import '../providers/theme_mode_provider.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;
  const QuizPage({
    super.key,
    required this.questions,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late PageController _pageController;
  int _questionNumber = 1;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Quiz",
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FadeInRight(
              child: Text(
                "Questions $_questionNumber / ${widget.questions.length}",
                style: AppFontStyle.title1Primary,
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColor.greyColor,
            ),
            Expanded(
              child: FadeInLeft(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.questions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final question = widget.questions[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomSeparator(
                          height: 12,
                        ),
                        Text(
                          question.title,
                          style: AppFontStyle.title3OffBlack(context),
                        ),
                        const CustomSeparator(
                          height: 24,
                        ),
                        Expanded(
                          child: Column(
                            children: question.options.map((option) {
                              final color = getColorForOption(question, option);
                              return GestureDetector(
                                onTap: () {
                                  if (question.isLocked) {
                                    return;
                                  } else {
                                    setState(() {
                                      question.isLocked = true;
                                      question.selectedOption = option;
                                    });
                                    if (question.selectedOption!.isCorrect) {
                                      _score++;
                                    }
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
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
                                          style:
                                              AppFontStyle.captionBigOffBlack(
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
                    );
                  },
                ),
              ),
            ),
            FadeInRight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _questionNumber > 1
                      ? GestureDetector(
                          onTap: () {
                            if (_questionNumber > 1) {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInExpo,
                              );
                              setState(() {
                                _questionNumber--;
                              });
                            }
                          },
                          child: Text(
                            'Previous',
                            style: AppFontStyle.buttonNavTextOffBlack(context),
                          ),
                        )
                      : const SizedBox.shrink(),
                  ElevatedButton(
                    onPressed: () {
                      if (_questionNumber < widget.questions.length) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInExpo,
                        );
                        setState(() {
                          _questionNumber++;
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizResultPage(
                              score: _score,
                              totalNumberOfQuestions: widget.questions.length,
                              questions: widget.questions,
                            ),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: _questionNumber < widget.questions.length
                          ? const MaterialStatePropertyAll(
                              AppColor.primaryColor)
                          : const MaterialStatePropertyAll(
                              AppColor.secondaryColor),
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(14)),
                    ),
                    child: Text(
                      _questionNumber < widget.questions.length
                          ? 'Next Question'
                          : 'See Result',
                      style: AppFontStyle.buttonNavTextPureWhite,
                    ),
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(QuizQuestion question, QuizOption option) {
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

  Widget getIconForOption(QuizQuestion question, QuizOption option) {
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
