import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:lae_lar_mel_app/app/pages/free_course_video_player_page.dart';
import 'package:lae_lar_mel_app/app/pages/instructor_profile_page.dart';
import 'package:lae_lar_mel_app/app/pages/pdf_viewer_page.dart';
import 'package:lae_lar_mel_app/app/pages/quiz_page.dart';
import 'package:lae_lar_mel_app/app/pages/premium_course_video_player_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_payment_option_selector.dart';
import 'package:lae_lar_mel_app/boxes.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pod_player/pod_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_material_model.dart';
import '../models/course_model.dart';
import '../providers/course_enrollment_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_add_to_wishlist_button.dart';
import '../widgets/custom_appbar_with_back_arrow_without_title.dart';
import '../widgets/custom_filled_button_rounded.dart';
import '../widgets/custom_separator.dart';

class CourseDetailsPage extends StatefulWidget {
  final Course course;
  const CourseDetailsPage({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  bool _isSecureMode = false;
  bool _isPlayArrowClicked = false;
  bool _isInstructorExpansionPanelExpanded = false;
  bool _isMorePaymentOptionsVisible = false;
  String? _selectedPaymentOption;
  late double _courseTotalInMMK;
  late double _discountInMMK;
  late double _grandTotalInMMK;
  late TextEditingController _couponTextController;
  late List<bool> _isExpandedList;
  late final PodPlayerController _podPlayerController;
  late final YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _courseTotalInMMK = widget.course.coursePriceInMMK;
    _discountInMMK = 0.0;
    _grandTotalInMMK = _courseTotalInMMK;
    _couponTextController = TextEditingController();
    _isExpandedList = List.generate(
      widget.course.courseSections.length,
      (index) => index == 0,
    );
    if (widget.course.courseType == "free") {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(widget.course.coursePreviewVideo)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
        ),
      );
    } else {
      _podPlayerController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.vimeo(widget.course.coursePreviewVideo),
        podPlayerConfig: const PodPlayerConfig(
          autoPlay: true,
          isLooping: false,
        ),
      )..initialise();
    }
  }

  @override
  void dispose() {
    _couponTextController.dispose();
    _podPlayerController.dispose();
    _youtubePlayerController.dispose();
    super.dispose();
  }

  void _checkSecureMode() {
    if (_isSecureMode) {
      FlutterWindowManager.addFlags(
        FlutterWindowManager.FLAG_SECURE,
      );
    } else {
      FlutterWindowManager.clearFlags(
        FlutterWindowManager.FLAG_SECURE,
      );
    }
  }

  void _toggleExpansionState(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  void _onExpansionChanged(int index, bool isExpanded) {
    setState(() {
      _isExpandedList[index] = isExpanded;
    });
  }

  void _applyCoupon() {
    String couponCode = _couponTextController.text;
    if (couponCode == 'Sample10') {
      setState(() {
        _discountInMMK = 0.1 * _courseTotalInMMK;
      });
    } else if (couponCode == 'Sample20') {
      setState(() {
        _discountInMMK = 0.2 * _courseTotalInMMK;
      });
    } else {
      setState(() {
        _discountInMMK = 0.0;
      });
    }
    setState(() {
      _grandTotalInMMK = _courseTotalInMMK - _discountInMMK;
    });
  }

  void _updateSelectedPaymentOption(String? option) {
    setState(() {
      _selectedPaymentOption = option;
    });
  }

  void _navigateToFreeCourseVideoPlayer(CourseMaterial courseMaterial) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FreeCourseVideoPlayerPage(
          videoUrl: courseMaterial.content,
        ),
      ),
    );
  }

  void _navigateToPremiumCourseVideoPlayer(CourseMaterial courseMaterial) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PremiumCourseVideoPlayerPage(
          videoID: courseMaterial.content,
        ),
      ),
    );
  }

  void _navigateToQuizPage(CourseMaterial courseMaterial) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(
          questions: courseMaterial.content,
        ),
      ),
    );
  }

  void _navigateToPdfViewerPage(CourseMaterial courseMaterial) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(
          pdfUrl: courseMaterial.content,
        ),
      ),
    );
  }

  void _navigateToInstructorProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InstructorProfilePage(),
      ),
    );
  }

  Future<void> _displayEnterCouponCodeAlertDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final themeModeProvider =
            Provider.of<ThemeModeProvider>(context, listen: false);
        return AlertDialog(
          backgroundColor: themeModeProvider.themeMode == ThemeMode.light
              ? AppColor.lightestBlueColor
              : AppColor.darkGreyLight2,
          contentPadding: const EdgeInsets.only(
            top: 20,
            left: 16,
            right: 16,
          ),
          actionsPadding: const EdgeInsets.only(
            right: 16,
          ),
          content: TextFormField(
            controller: _couponTextController,
            cursorColor: AppColor.primaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.greyColor,
              hintText: AppLocalizations.of(context)!.enter_coupon_code,
              hintStyle: AppFontStyle.inputHintText,
              labelStyle: AppFontStyle.inputText,
              contentPadding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 20,
                bottom: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _applyCoupon();
                Navigator.of(context).pop();
                setState(() {
                  _displayPaymentBottomSheet(context);
                });
              },
              child: Text(
                AppLocalizations.of(context)!.code_apply,
                style: AppFontStyle.navTextPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _displayPaymentBottomSheet(context);
                });
              },
              child: Text(
                AppLocalizations.of(context)!.code_cancel,
                style: AppFontStyle.navTextOffBlack(context),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _displayPaymentBottomSheet(BuildContext context) async {
    final courseEnrollmentProvider =
        Provider.of<CourseEnrollmentProvider>(context, listen: false);
    return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.courseName,
                    style: AppFontStyle.title3OffBlack(context),
                  ),
                  const CustomSeparator(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                      Text(
                        '${_courseTotalInMMK.toStringAsFixed(2)} ${AppLocalizations.of(context)!.mmk}',
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Discount',
                            style: AppFontStyle.captionBigOffBlack(context),
                          ),
                          const CustomSeparator(
                            height: 0,
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              _displayEnterCouponCodeAlertDialog(context);
                            },
                            child: Text(
                              '[${AppLocalizations.of(context)!.coupon_code}]',
                              style:
                                  AppFontStyle.captionMediumSecondary(context),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_discountInMMK.toStringAsFixed(2)} ${AppLocalizations.of(context)!.mmk}',
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Total',
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                      Text(
                        '${_grandTotalInMMK.toStringAsFixed(2)} ${AppLocalizations.of(context)!.mmk}',
                        style: AppFontStyle.subtitleOffBlack(context),
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 24),
                  Text(
                    AppLocalizations.of(context)!.select_payment_method,
                    style: AppFontStyle.captionBigOffBlack(context),
                  ),
                  const CustomSeparator(height: 12),
                  PaymentOptionSelector(
                    isMorePaymentOptionsVisible: _isMorePaymentOptionsVisible,
                    onOptionSelected: _updateSelectedPaymentOption,
                  ),
                  const CustomSeparator(height: 12),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isMorePaymentOptionsVisible =
                              !_isMorePaymentOptionsVisible;
                        });
                      },
                      child: Text(
                        _isMorePaymentOptionsVisible
                            ? 'Less payment options'
                            : 'More payment options',
                        style: AppFontStyle.bodyNavTextOffBlack(context),
                      ),
                    ),
                  ),
                  const CustomSeparator(height: 20),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        if (_selectedPaymentOption != null) {
                          Navigator.of(context).pop();
                          // Implement your payment logic here.
                          // For example, you can use packages like in_app_purchase or another payment method to process payments.
                          // For example, you might show a payment gateway or payment dialog.
                          // Upon successful payment, you can enroll the user in the course.
                          // Once payment is successful, you can enroll the user in the course, similar to the enrollTheCourse method.
                          courseEnrollmentProvider
                              .enrollCourse(widget.course.courseId);
                          displaySuccessfulSnackBar(
                            context,
                            AppLocalizations.of(context)!
                                .successfully_enrolled_course,
                            2000,
                          );
                        } else if (_selectedPaymentOption == null) {
                          Fluttertoast.showToast(
                            msg: AppLocalizations.of(context)!
                                .select_payment_method,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                          );
                        }
                      },
                      color: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      height: 50,
                      elevation: 1.5,
                      hoverElevation: 2.0,
                      child: Text(
                        AppLocalizations.of(context)!.pay_now,
                        style: AppFontStyle.buttonNavTextPureWhite,
                      ),
                    ),
                  ),
                  const CustomSeparator(height: 12),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.or,
                      style: AppFontStyle.captionMediumOffBlack(context),
                    ),
                  ),
                  const CustomSeparator(height: 12),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColor.primaryColor,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .purchase_with_reward_points,
                            style: AppFontStyle.navTextPrimary,
                          ),
                          const Icon(
                            Icons.star_rounded,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildVideoPlayer() {
    if (widget.course.courseType == "free") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                backgroundColor: AppColor.offBlackColor,
                handleColor: AppColor.primaryColor,
                bufferedColor: AppColor.lightBlackColor,
                playedColor: AppColor.primaryColor,
              ),
            ),
            RemainingDuration(),
            const PlaybackSpeedButton(),
          ],
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: PodVideoPlayer(
          controller: _podPlayerController,
          alwaysShowProgressBar: false,
          podProgressBarConfig: const PodProgressBarConfig(
            backgroundColor: AppColor.offBlackColor,
            circleHandlerColor: AppColor.primaryColor,
            bufferedBarColor: AppColor.lightBlackColor,
            playingBarColor: AppColor.primaryColor,
          ),
          onLoading: (context) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
                CustomSeparator(
                  height: 18,
                ),
                SizedBox(
                  height: 20.0,
                  child: Text(
                    'Loading',
                    style: AppFontStyle.captionBigPureWhite,
                  ),
                ),
              ],
            );
          },
        ),
      );
    }
  }

  Widget _buildPreviewImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'courseImage${widget.course.coursePreviewImage}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 180,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.course.coursePreviewImage,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: ElasticIn(
            child: IconButton(
              icon: const Icon(
                Icons.play_arrow_rounded,
                size: 120,
                color: AppColor.pureWhiteColor,
              ),
              onPressed: () {
                setState(() {
                  _isSecureMode = !_isSecureMode;
                  _isPlayArrowClicked = !_isPlayArrowClicked;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          child: ElasticIn(
            child: Text(
              AppLocalizations.of(context)!.preview_course,
              style: AppFontStyle.captionMediumPureWhite,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseMaterial(
      CourseMaterial courseMaterial, int index, int currentSectionIndex) {
    IconData iconData;
    final themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    final courseEnrollmentProvider =
        Provider.of<CourseEnrollmentProvider>(context);
    final bool isTheCourseEnrolled =
        courseEnrollmentProvider.isCourseEnrolled(widget.course.courseId);

    Future<void> displayPremiumAlertDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            final themeModeProvider =
                Provider.of<ThemeModeProvider>(context, listen: false);
            return AlertDialog(
              backgroundColor: themeModeProvider.themeMode == ThemeMode.light
                  ? AppColor.lightestBlueColor
                  : AppColor.darkGreyLight2,
              title: Text(
                AppLocalizations.of(context)!.paid_content,
                style: AppFontStyle.alertTitleOffBlack(context),
              ),
              content: Text(
                AppLocalizations.of(context)!.paid_content_message,
                style: AppFontStyle.alertTextOffBlack(context),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _displayPaymentBottomSheet(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.buy_now,
                    style: AppFontStyle.navTextPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.close,
                    style: AppFontStyle.navTextOffBlack(context),
                  ),
                ),
              ],
            );
          });
    }

    Future<void> displayFreeEnrollAlertDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            final themeModeProvider =
                Provider.of<ThemeModeProvider>(context, listen: false);
            return AlertDialog(
              backgroundColor: themeModeProvider.themeMode == ThemeMode.light
                  ? AppColor.lightestBlueColor
                  : AppColor.darkGreyLight2,
              title: Text(
                AppLocalizations.of(context)!.enroll_course,
                style: AppFontStyle.alertTitleOffBlack(context),
              ),
              content: Text(
                AppLocalizations.of(context)!.enroll_course_message,
                style: AppFontStyle.alertTextOffBlack(context),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (!isTheCourseEnrolled) {
                      courseEnrollmentProvider
                          .enrollCourse(widget.course.courseId);
                      displaySuccessfulSnackBar(
                        context,
                        AppLocalizations.of(context)!
                            .successfully_enrolled_course,
                        2000,
                      );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.enroll_now,
                    style: AppFontStyle.navTextPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.close,
                    style: AppFontStyle.navTextOffBlack(context),
                  ),
                ),
              ],
            );
          });
    }

    if (courseEnrollmentProvider.isCourseEnrolled(widget.course.courseId)) {
      switch (courseMaterial.courseMaterialType) {
        case "video":
          iconData = Icons.play_circle_outline_rounded;
          break;
        case "document":
          iconData = Icons.download_rounded;
          break;
        case "quiz":
          iconData = Icons.lightbulb_outline_rounded;
          break;
        default:
          iconData = Icons.description;
          break;
      }
    } else {
      if (widget.course.courseType == "premium") {
        if (widget.course.courseSections[currentSectionIndex] ==
            widget.course.courseSections[0]) {
          // This is the first premium course section.
          if (index < 3) {
            // Display the icons for the first three course materials in the first premium course section based on the course material type.
            switch (courseMaterial.courseMaterialType) {
              case "video":
                iconData = Icons.play_circle_outline_rounded;
                break;
              case "document":
                iconData = Icons.download_rounded;
                break;
              case "quiz":
                iconData = Icons.lightbulb_outline_rounded;
                break;
              default:
                iconData = Icons.description;
                break;
            }
          } else {
            // Handle the lock icons for the other course materials in the first premium course section.
            iconData = Icons.lock;
          }
        } else {
          // Display the lock icons for the course materials in other premium course sections.
          iconData = Icons.lock;
        }
      } else {
        // Display the icons for the course materials in free course sections based on the course material type.
        switch (courseMaterial.courseMaterialType) {
          case "video":
            iconData = Icons.play_circle_outline_rounded;
            break;
          case "document":
            iconData = Icons.download_rounded;
            break;
          case "quiz":
            iconData = Icons.lightbulb_outline_rounded;
            break;
          default:
            iconData = Icons.description;
            break;
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                courseMaterial.courseMaterialId.toString(),
                style: AppFontStyle.bodyOffBlack(context),
              ),
              const CustomSeparator(
                width: 18,
                height: 0,
              ),
              courseMaterial.durationInMinute != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Text(
                            courseMaterial.courseMaterialTitle,
                            style: AppFontStyle.bodyOffBlack(context),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "${courseMaterial.durationInMinute!.toStringAsFixed(2)} min",
                          style: AppFontStyle.captionSmallOffBlack(context),
                        ),
                      ],
                    )
                  : Text(
                      courseMaterial.courseMaterialTitle,
                      style: AppFontStyle.bodyOffBlack(context),
                    ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(200),
            ),
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                if (courseEnrollmentProvider
                    .isCourseEnrolled(widget.course.courseId)) {
                  //enrolled courses
                  if (widget.course.courseType == "premium") {
                    //enrolled premium courses
                    switch (courseMaterial.courseMaterialType) {
                      case "video":
                        _navigateToPremiumCourseVideoPlayer(courseMaterial);
                        break;
                      case "document":
                        _navigateToPdfViewerPage(courseMaterial);
                        break;
                      case "quiz":
                        _navigateToQuizPage(courseMaterial);
                        break;
                      default:
                        // Set a default action if needed
                        break;
                    }
                  } else {
                    //enrolled free courses
                    switch (courseMaterial.courseMaterialType) {
                      case "video":
                        _navigateToFreeCourseVideoPlayer(courseMaterial);
                        break;
                      case "document":
                        _navigateToPdfViewerPage(courseMaterial);
                        break;
                      case "quiz":
                        _navigateToQuizPage(courseMaterial);
                        break;
                      default:
                        // Set a default action if needed
                        break;
                    }
                  }
                } else {
                  //courses that are not enrolled
                  if (widget.course.courseType == "premium") {
                    // Premium course sections
                    if (widget.course.courseSections[currentSectionIndex] ==
                        widget.course.courseSections[0]) {
                      // This is the first premium course section.
                      if (index < 3) {
                        // Handle the actions for the first three course materials in the first premium course section based on the course material type.
                        switch (courseMaterial.courseMaterialType) {
                          case "video":
                            _navigateToPremiumCourseVideoPlayer(courseMaterial);
                            break;
                          case "document":
                            _navigateToPdfViewerPage(courseMaterial);
                            break;
                          case "quiz":
                            _navigateToQuizPage(courseMaterial);
                            break;
                          default:
                            // Set a default action if needed
                            break;
                        }
                      } else {
                        // Handle the actions for the other course materials in the first premium course section.
                        displayPremiumAlertDialog();
                      }
                    } else {
                      // Handle the actions for the course materials in other premium course sections.
                      displayPremiumAlertDialog();
                    }
                  } else {
                    // Free course sections
                    if (widget.course.courseSections[currentSectionIndex] ==
                        widget.course.courseSections[0]) {
                      // This is the first free course section.
                      if (index < 3) {
                        // Handle the actions for the first three course materials in the first free course section based on the course material type.
                        switch (courseMaterial.courseMaterialType) {
                          case "video":
                            _navigateToFreeCourseVideoPlayer(courseMaterial);
                            break;
                          case "document":
                            _navigateToPdfViewerPage(courseMaterial);
                            break;
                          case "quiz":
                            _navigateToQuizPage(courseMaterial);
                            break;
                          default:
                            // Set a default action if needed
                            break;
                        }
                      } else {
                        // Handle the actions for the other course materials in the first free course section.
                        displayFreeEnrollAlertDialog();
                      }
                    } else {
                      // Handle the actions for the course materials in other free course sections.
                      displayFreeEnrollAlertDialog();
                    }
                  }
                }
              },
              child: Icon(
                iconData,
                color: themeModeProvider.themeMode == ThemeMode.light
                    ? AppColor.secondaryColor
                    : AppColor.primaryColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _checkSecureMode();
    int currentSectionIndex;
    final isFavourite = boxCourses.get('key_${widget.course.courseId}') != null;
    final themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    final courseEnrollmentProvider =
        Provider.of<CourseEnrollmentProvider>(context);
    final bool isTheCourseEnrolled =
        courseEnrollmentProvider.isCourseEnrolled(widget.course.courseId);

    return Scaffold(
      appBar: CustomAppBarWithBackArrowWithoutTitle(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        scrollDirection: Axis.vertical,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _isPlayArrowClicked == true
                ? _buildVideoPlayer()
                : _buildPreviewImage(),
          ),
          const CustomSeparator(height: 24),
          FadeInLeft(
            child: Text(
              widget.course.courseName,
              style: AppFontStyle.title3OffBlack(context),
            ),
          ),
          const CustomSeparator(height: 4),
          FadeInLeft(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.course.courseLevel,
                      style: AppFontStyle.bodyNavTextPrimary,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: Text('|'),
                    ),
                    Text(
                      widget.course.courseSkill,
                      style: AppFontStyle.bodyNavTextPrimary,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 4, right: 4, top: 2, bottom: 2),
                    child: Text(
                      '${widget.course.courseTotalDurationInHour.toStringAsFixed(1)}  ${AppLocalizations.of(context)!.hours}',
                      style: AppFontStyle.captionMediumOffBlack(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const CustomSeparator(height: 25),
          FadeInLeft(
            child: ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: const EdgeInsets.all(0),
              children: [
                ExpansionPanel(
                  hasIcon: false,
                  backgroundColor:
                      themeModeProvider.themeMode == ThemeMode.light
                          ? AppColor.pureWhiteColor
                          : AppColor.darkGrey,
                  headerBuilder: (context, isExpanded) {
                    return Material(
                      color: themeModeProvider.themeMode == ThemeMode.light
                          ? AppColor.pureWhiteColor
                          : AppColor.darkGrey,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isInstructorExpansionPanelExpanded =
                                !_isInstructorExpansionPanelExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: AppColor.greyColor,
                                  backgroundImage: NetworkImage(widget.course
                                      .courseInstructor.courseInstructorImage),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Center(
                                                child:
                                                    FadeInImage.memoryNetwork(
                                                  placeholder:
                                                      kTransparentImage,
                                                  image: widget
                                                      .course
                                                      .courseInstructor
                                                      .courseInstructorImage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const CustomSeparator(width: 18),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.course.courseInstructor
                                          .courseInstructorName,
                                      style:
                                          AppFontStyle.title3OffBlack(context),
                                    ),
                                    Text(
                                      widget.course.courseInstructor
                                          .courseInstructorMajor,
                                      style: AppFontStyle.captionMediumOffBlack(
                                          context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              _isInstructorExpansionPanelExpanded == false
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_up_rounded,
                              color:
                                  themeModeProvider.themeMode == ThemeMode.light
                                      ? AppColor.offBlackColor
                                      : AppColor.greyColor,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Column(
                      children: [
                        Text(
                          widget.course.courseInstructor
                              .courseInstructorDescription,
                          style: AppFontStyle.bodyOffBlack(context),
                          textAlign: TextAlign.justify,
                        ),
                        const CustomSeparator(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  _navigateToInstructorProfilePage();
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: AppColor.primaryColor,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.view_profile,
                                  style: AppFontStyle.buttonNavTextOffBlack(
                                      context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  isExpanded: _isInstructorExpansionPanelExpanded,
                ),
              ],
            ),
          ),
          const CustomSeparator(height: 25),
          FadeInLeft(
            child: Text(
              widget.course.courseType == "free"
                  ? AppLocalizations.of(context)!.free
                  : '${_courseTotalInMMK.toStringAsFixed(0)} ${AppLocalizations.of(context)!.mmk}',
              style: AppFontStyle.title3OffBlack(context),
            ),
          ),
          const CustomSeparator(height: 15),
          FadeInLeft(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: CustomFilledButtonRounded(
                    onPressed: () {
                      if (!isTheCourseEnrolled) {
                        if (widget.course.courseType == "free") {
                          courseEnrollmentProvider
                              .enrollCourse(widget.course.courseId);
                          displaySuccessfulSnackBar(
                            context,
                            AppLocalizations.of(context)!
                                .successfully_enrolled_course,
                            2000,
                          );
                        } else {
                          _displayPaymentBottomSheet(context);
                        }
                      } else {
                        displaySuccessfulSnackBar(
                          context,
                          AppLocalizations.of(context)!.already_enrolled_course,
                          2000,
                        );
                      }
                    },
                    text: widget.course.courseType == "free"
                        ? isTheCourseEnrolled
                            ? AppLocalizations.of(context)!.course_enrolled
                            : AppLocalizations.of(context)!.free_enroll
                        : isTheCourseEnrolled
                            ? AppLocalizations.of(context)!.course_enrolled
                            : AppLocalizations.of(context)!.buy_now,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomAddToWishlistButton(
                    iconData: isFavourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    onPressed: () {
                      if (isFavourite) {
                        displaySuccessfulSnackBar(
                          context,
                          AppLocalizations.of(context)!.removed_course,
                          1200,
                        );
                        //Todo: .delete
                        setState(() {
                          boxCourses.delete('key_${widget.course.courseId}');
                        });
                      } else {
                        displaySuccessfulSnackBar(
                          context,
                          AppLocalizations.of(context)!.added_course,
                          1200,
                        );
                        //Todo: .put
                        setState(() {
                          boxCourses.put(
                            'key_${widget.course.courseId}',
                            Course(
                              courseId: widget.course.courseId,
                              courseName: widget.course.courseName,
                              courseType: widget.course.courseType,
                              coursePriceInMMK: widget.course.coursePriceInMMK,
                              courseTotalDurationInHour:
                                  widget.course.courseTotalDurationInHour,
                              courseInstructor: widget.course.courseInstructor,
                              courseLanguage: widget.course.courseLanguage,
                              courseLevel: widget.course.courseLevel,
                              courseSkill: widget.course.courseSkill,
                              coursePreviewImage:
                                  widget.course.coursePreviewImage,
                              coursePreviewVideo:
                                  widget.course.coursePreviewVideo,
                              courseSections: widget.course.courseSections,
                            ),
                          );
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const CustomSeparator(height: 30),
          FadeInLeft(
            child: Text(
              AppLocalizations.of(context)!.course_content,
              style: AppFontStyle.title3OffBlack(context),
            ),
          ),
          const CustomSeparator(height: 20),
          //course content
          FadeInLeft(
            child: ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: const EdgeInsets.all(0),
              animationDuration: const Duration(milliseconds: 300),
              expansionCallback: _onExpansionChanged,
              children: widget.course.courseSections
                  .asMap()
                  .entries
                  .map<ExpansionPanel>((entry) {
                final index = entry.key;
                currentSectionIndex = index;
                final courseSection = entry.value;
                return ExpansionPanel(
                  backgroundColor:
                      themeModeProvider.themeMode == ThemeMode.light
                          ? AppColor.pureWhiteColor
                          : AppColor.darkGrey,
                  hasIcon: false,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return Material(
                      color: themeModeProvider.themeMode == ThemeMode.light
                          ? AppColor.pureWhiteColor
                          : AppColor.darkGrey,
                      child: InkWell(
                        onTap: () {
                          _toggleExpansionState(index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 240,
                              child: Text(
                                courseSection.courseSectionTitle,
                                style: AppFontStyle.captionBigOffBlack(context),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Icon(
                              isExpanded == true
                                  ? Icons.remove_rounded
                                  : Icons.add_rounded,
                              color:
                                  themeModeProvider.themeMode == ThemeMode.light
                                      ? AppColor.offBlackColor
                                      : AppColor.greyColor,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  body: SlideInDown(
                    child: Column(
                      children: courseSection.courseMaterials
                          .asMap()
                          .entries
                          .map<Widget>((entry) {
                        final index = entry.key;
                        final courseMaterial = entry.value;
                        return _buildCourseMaterial(
                            courseMaterial, index, currentSectionIndex);
                      }).toList(),
                    ),
                  ),
                  isExpanded: _isExpandedList[index],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> displaySuccessfulSnackBar(
    BuildContext context, String message, int durationInMilliseconds) async {
  // Create a Completer to represent the completion of the future
  final Completer<void> completer = Completer<void>();
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: durationInMilliseconds),
          backgroundColor: AppColor.primaryColor,
          showCloseIcon: true,
          closeIconColor: AppColor.pureWhiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
            ),
          ),
          content: Text(
            message,
            style: AppFontStyle.alertTextPureWhite,
          ),
        ),
      )
      .closed
      .then((reason) {
    completer.complete(); // Complete the future when SnackBar is hidden
  });

  // Return the Future
  return completer.future;
}
