import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:lae_lar_mel_app/app/pages/video_player_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_payment_option_selector.dart';
import 'package:lae_lar_mel_app/boxes.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pod_player/pod_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../enums/enums.dart';
import '../models/course_material_model.dart';
import '../models/course_model.dart';
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
  bool _isTheCourseEnrolled = false;
  String _couponCode = "";
  double _discount = 0.0;
  late double _coursePrice;
  late double _grandTotal;
  late TextEditingController _couponTextController;
  late List<bool> _isExpandedList;
  late final PodPlayerController _podPlayerController;
  String? _selectedPaymentOption;

  @override
  void initState() {
    super.initState();
    _coursePrice = widget.course.coursePriceInMMK;
    _grandTotal = _coursePrice;
    _couponTextController = TextEditingController();
    _isExpandedList = List.generate(
        widget.course.courseSections.length, (index) => index == 0);
    _podPlayerController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(widget.course.coursePreviewVideo),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        isLooping: false,
      ),
    )..initialise();
  }

  @override
  void dispose() {
    _couponTextController.dispose();
    _podPlayerController.dispose();
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

  void _applyCoupon() {
    _couponCode = _couponTextController.text;
    if (_couponCode == 'SAMPLE10') {
      setState(() {
        _discount = 0.1 * _coursePrice;
      });
    } else if (_couponCode == 'SAMPLE20') {
      setState(() {
        _discount = 0.2 * _coursePrice;
      });
    } else {
      setState(() {
        _discount = 0.0;
      });
    }
    setState(() {
      _grandTotal = _coursePrice - _discount;
    });
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

  void _navigateToVideoPlayer(CourseMaterial courseMaterial) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerPage(
          videoID: courseMaterial.content,
        ),
      ),
    );
  }

  void _updateSelectedOption(String? option) {
    setState(() {
      _selectedPaymentOption = option;
    });
  }

  void _enrollTheCourse() {
    setState(() {
      _isTheCourseEnrolled = !_isTheCourseEnrolled;
    });
    displaySuccessfulSnackBar(
      context,
      AppLocalizations.of(context)!.successfully_enrolled_course,
      2000,
    );
  }

  void _makePayment() {
    _enrollTheCourse();
  }

  Future<void> _displayEnterCouponCodeAlertDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                  _displayPaymentBottomSheet();
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
                  _displayPaymentBottomSheet();
                });
              },
              child: Text(
                AppLocalizations.of(context)!.code_cancel,
                style: AppFontStyle.navTextOffBlack,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _displayPremiumAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              AppLocalizations.of(context)!.paid_content,
              style: AppFontStyle.alertTitle,
            ),
            content: Text(
              AppLocalizations.of(context)!.paid_content_message,
              style: AppFontStyle.alertText,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _displayPaymentBottomSheet();
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
                  style: AppFontStyle.navTextOffBlack,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _displayFreeEnrollAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              AppLocalizations.of(context)!.enroll_course,
              style: AppFontStyle.alertTitle,
            ),
            content: Text(
              AppLocalizations.of(context)!.enroll_course_message,
              style: AppFontStyle.alertText,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _enrollTheCourse();
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
                  style: AppFontStyle.navTextOffBlack,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _displayPaymentBottomSheet() async {
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
                    style: AppFontStyle.title3OffBlack,
                  ),
                  const CustomSeparator(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: AppFontStyle.captionBigOffBlack,
                      ),
                      Text(
                        '${_coursePrice.toStringAsFixed(2)} ${AppLocalizations.of(context)!.mmk}',
                        style: AppFontStyle.captionBigOffBlack,
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Discount',
                            style: AppFontStyle.captionBigOffBlack,
                          ),
                          const CustomSeparator(
                            height: 0,
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              _displayEnterCouponCodeAlertDialog();
                            },
                            child: Text(
                              '[${AppLocalizations.of(context)!.coupon_code}]',
                              style: AppFontStyle.captionMediumSecondary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_discount.toStringAsFixed(2)} ${AppLocalizations.of(context)!.mmk}',
                        style: AppFontStyle.captionBigOffBlack,
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Grand Total',
                        style: AppFontStyle.captionBigOffBlack,
                      ),
                      Text(
                        '${_grandTotal.toStringAsFixed(2)} ${AppLocalizations.of(context)!.mmk}',
                        style: AppFontStyle.subtitleOffBlack,
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 24),
                  Text(
                    AppLocalizations.of(context)!.select_payment_method,
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  const CustomSeparator(height: 12),
                  PaymentOptionSelector(
                    isMorePaymentOptionsVisible: _isMorePaymentOptionsVisible,
                    onOptionSelected: _updateSelectedOption,
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
                        style: AppFontStyle.bodyNavTextOffBlack,
                      ),
                    ),
                  ),
                  const CustomSeparator(height: 24),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        if (_selectedPaymentOption != null) {
                          Navigator.of(context).pop();
                          _makePayment();
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
                        style: AppFontStyle.navTextPureWhite,
                      ),
                    ),
                  ),
                  const CustomSeparator(height: 12),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.back,
                        style: AppFontStyle.navTextOffBlack,
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

    if (_isTheCourseEnrolled) {
      switch (courseMaterial.courseMaterialType) {
        case CourseMaterialType.video:
          iconData = Icons.play_circle_outline_rounded;
          break;
        case CourseMaterialType.document:
          iconData = Icons.download_rounded;
          break;
        case CourseMaterialType.quiz:
          iconData = Icons.lightbulb_outline_rounded;
          break;
        default:
          iconData = Icons.description;
          break;
      }
    } else {
      if (widget.course.courseType == CourseType.premium) {
        if (widget.course.courseSections[currentSectionIndex] ==
            widget.course.courseSections[0]) {
          // This is the first premium course section.
          if (index < 3) {
            // Display the icons for the first three course materials in the first premium course section based on the course material type.
            switch (courseMaterial.courseMaterialType) {
              case CourseMaterialType.video:
                iconData = Icons.play_circle_outline_rounded;
                break;
              case CourseMaterialType.document:
                iconData = Icons.download_rounded;
                break;
              case CourseMaterialType.quiz:
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
          case CourseMaterialType.video:
            iconData = Icons.play_circle_outline_rounded;
            break;
          case CourseMaterialType.document:
            iconData = Icons.download_rounded;
            break;
          case CourseMaterialType.quiz:
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
                style: AppFontStyle.bodyOffBlack,
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
                            style: AppFontStyle.bodyOffBlack,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "${courseMaterial.durationInMinute!.toStringAsFixed(2)} min",
                          style: AppFontStyle.captionSmallLightBlack,
                        ),
                      ],
                    )
                  : Text(
                      courseMaterial.courseMaterialTitle,
                      style: AppFontStyle.bodyOffBlack,
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
                if (_isTheCourseEnrolled) {
                  switch (courseMaterial.courseMaterialType) {
                    case CourseMaterialType.video:
                      _navigateToVideoPlayer(courseMaterial);
                      break;
                    case CourseMaterialType.document:
                      break;
                    case CourseMaterialType.quiz:
                      break;
                    default:
                      // Set a default action if needed
                      break;
                  }
                } else {
                  if (widget.course.courseType == CourseType.premium) {
                    // Premium course sections
                    if (widget.course.courseSections[currentSectionIndex] ==
                        widget.course.courseSections[0]) {
                      // This is the first premium course section.
                      if (index < 3) {
                        // Handle the actions for the first three course materials in the first premium course section based on the course material type.
                        switch (courseMaterial.courseMaterialType) {
                          case CourseMaterialType.video:
                            _navigateToVideoPlayer(courseMaterial);
                            break;
                          case CourseMaterialType.document:
                            break;
                          case CourseMaterialType.quiz:
                            break;
                          default:
                            // Set a default action if needed
                            break;
                        }
                      } else {
                        // Handle the actions for the other course materials in the first premium course section.
                        _displayPremiumAlertDialog();
                      }
                    } else {
                      // Handle the actions for the course materials in other premium course sections.
                      _displayPremiumAlertDialog();
                    }
                  } else {
                    // Free course sections
                    if (widget.course.courseSections[currentSectionIndex] ==
                        widget.course.courseSections[0]) {
                      // This is the first free course section.
                      if (index < 3) {
                        // Handle the actions for the first three course materials in the first free course section based on the course material type.
                        switch (courseMaterial.courseMaterialType) {
                          case CourseMaterialType.video:
                            _navigateToVideoPlayer(courseMaterial);
                            break;
                          case CourseMaterialType.document:
                            break;
                          case CourseMaterialType.quiz:
                            break;
                          default:
                            // Set a default action if needed
                            break;
                        }
                      } else {
                        // Handle the actions for the other course materials in the first free course section.
                        _displayFreeEnrollAlertDialog();
                      }
                    } else {
                      // Handle the actions for the course materials in other free course sections.
                      _displayFreeEnrollAlertDialog();
                    }
                  }
                }
              },
              child: Icon(
                iconData,
                color: AppColor.secondaryColor,
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
    int currentSectionIndex;
    final isFavourite = boxCourses.get('key_${widget.course.courseId}') != null;
    _checkSecureMode();
    return Scaffold(
      appBar: CustomAppBarWithBackArrowWithoutTitle(
        appBarBackgroundColor: AppColor.pureWhiteColor,
        appBarBackArrowColor: AppColor.offBlackColor,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
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
              style: AppFontStyle.title3OffBlack,
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
                      style: AppFontStyle.captionMediumOffBlack,
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
                  headerBuilder: (context, isExpanded) {
                    return Material(
                      color: AppColor.pureWhiteColor,
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
                                      style: AppFontStyle.title3OffBlack,
                                    ),
                                    Text(
                                      widget.course.courseInstructor
                                          .courseInstructorMajor,
                                      style: AppFontStyle.captionMediumOffBlack,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              _isInstructorExpansionPanelExpanded == false
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_up_rounded,
                              color: AppColor.offBlackColor,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      widget
                          .course.courseInstructor.courseInstructorDescription,
                      style: AppFontStyle.bodyOffBlack,
                      textAlign: TextAlign.justify,
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
              widget.course.courseType == CourseType.free
                  ? AppLocalizations.of(context)!.free
                  : '${_coursePrice.toStringAsFixed(0)} ${AppLocalizations.of(context)!.mmk}',
              style: AppFontStyle.title3OffBlack,
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
                      widget.course.courseType == CourseType.free
                          ? (!_isTheCourseEnrolled)
                              ? _enrollTheCourse()
                              : displaySuccessfulSnackBar(
                                  context,
                                  AppLocalizations.of(context)!
                                      .already_enrolled_course,
                                  2000,
                                )
                          : (!_isTheCourseEnrolled)
                              ? _displayPaymentBottomSheet()
                              : displaySuccessfulSnackBar(
                                  context,
                                  AppLocalizations.of(context)!
                                      .already_enrolled_course,
                                  2000,
                                );
                    },
                    text: widget.course.courseType == CourseType.free
                        ? _isTheCourseEnrolled
                            ? AppLocalizations.of(context)!.course_enrolled
                            : AppLocalizations.of(context)!.free_enroll
                        : _isTheCourseEnrolled
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
              style: AppFontStyle.title3OffBlack,
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
                  hasIcon: false,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return Material(
                      color: AppColor.pureWhiteColor,
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
                                style: AppFontStyle.captionBigOffBlack,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Icon(
                              isExpanded == true
                                  ? Icons.remove_rounded
                                  : Icons.add_rounded,
                              color: AppColor.offBlackColor,
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
