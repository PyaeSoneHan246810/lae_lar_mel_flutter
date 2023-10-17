import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:lae_lar_mel_app/app/pages/video_player_page.dart';
import 'package:lae_lar_mel_app/boxes.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pod_player/pod_player.dart';

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
  String couponCode = "";
  double discount = 0.0;
  late double coursePrice;
  late double grandTotal;
  late TextEditingController _couponTextController;
  late List<bool> _isExpandedList;
  late final PodPlayerController _podPlayerController;

  @override
  void initState() {
    super.initState();
    coursePrice = widget.course.coursePriceInMMK;
    grandTotal = coursePrice;
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
    couponCode = _couponTextController.text;
    if (couponCode == 'SAMPLE10') {
      setState(() {
        discount = 0.1 * coursePrice;
      });
    } else if (couponCode == 'SAMPLE20') {
      setState(() {
        discount = 0.2 * coursePrice;
      });
    } else {
      setState(() {
        discount = 0.0;
      });
    }
    setState(() {
      grandTotal = coursePrice - discount;
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

  Future<void> _displaySuccessfulSnackBar(
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
                        '${coursePrice.toStringAsFixed(2)} MMK',
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
                            child: const Text(
                              '[Add Coupon Code]',
                              style: AppFontStyle.captionMediumSecondary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${discount.toStringAsFixed(2)} MMK',
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
                        '${grandTotal.toStringAsFixed(2)} MMK',
                        style: AppFontStyle.subtitleOffBlack,
                      ),
                    ],
                  ),
                  const CustomSeparator(height: 24),
                  const Text(
                    'Select payment method',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  const CustomSeparator(height: 12),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 100,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/kbz_pay_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 100,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/aya_pay_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 100,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/one_pay_logo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const CustomSeparator(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 100,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/wave_pay_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 100,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/visa_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                width: 100,
                                height: 75,
                                child: Image.asset(
                                  'assets/images/mastercard_logo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const CustomSeparator(height: 12),
                      Visibility(
                        visible: _isMorePaymentOptionsVisible,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox(
                                  width: 100,
                                  height: 75,
                                  child: Image.asset(
                                    'assets/images/mPiteSan_logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox(
                                  width: 100,
                                  height: 75,
                                  child: Image.asset(
                                    'assets/images/mpu_logo.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox(
                                  width: 100,
                                  height: 75,
                                  child: Image.asset(
                                    'assets/images/a_bank_logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
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
              hintText: 'Enter your coupon code',
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
              child: const Text(
                "Apply",
                style: AppFontStyle.navTextPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
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
            title: const Text(
              'Paid Content',
              style: AppFontStyle.alertTitle,
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    'Please buy the course to access the premium contents.',
                    style: AppFontStyle.alertText,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _displayPaymentBottomSheet();
                },
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                      color: AppColor.primaryColor, fontFamily: 'Poppins'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: AppColor.pureBlackColor,
                    fontFamily: 'Poppins',
                  ),
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
            title: const Text(
              'Enroll the course',
              style: AppFontStyle.alertTitle,
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    'This course is completely free. Enroll the course to start learning from our skilled instructors.',
                    style: AppFontStyle.alertText,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _displaySuccessfulSnackBar(
                    context,
                    "You have successfully enrolled the course.",
                    2000,
                  );
                },
                child: const Text(
                  'Enroll now',
                  style: TextStyle(
                      color: AppColor.primaryColor, fontFamily: 'Poppins'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: AppColor.pureBlackColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          );
        });
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
          tag: 'courseImage${widget.course.courseImage}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 180,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.course.courseImage,
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
            child: const Text(
              'Preview the course',
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
    Color iconColor;

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
              // Set a default icon if needed
              iconData = Icons.description;
              break;
          }
          iconColor = AppColor.secondaryColor;
        } else {
          // Handle the lock icons for the other course materials in the first premium course section.
          iconData = Icons.lock;
          iconColor = AppColor.secondaryColor;
        }
      } else {
        // Display the lock icons for the course materials in other premium course sections.
        iconData = Icons.lock;
        iconColor = AppColor.secondaryColor;
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
          // Set a default icon if needed
          iconData = Icons.description;
          break;
      }
      iconColor = AppColor.secondaryColor;
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
              },
              child: Icon(
                iconData,
                color: iconColor,
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
      backgroundColor: AppColor.pureWhiteColor,
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
                      '${widget.course.courseTotalDurationInHour.toStringAsFixed(1)} hours',
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
                                  backgroundImage: NetworkImage(
                                      widget.course.courseInstructorImage),
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
                                                  image: widget.course
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
                                      widget.course.courseInstructorName,
                                      style: AppFontStyle.title3OffBlack,
                                    ),
                                    Text(
                                      widget.course.courseInstructorMajor,
                                      style: AppFontStyle.captionMediumOffBlack,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              _isInstructorExpansionPanelExpanded == false
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
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
                      widget.course.courseInstructorDescription,
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
                  ? 'Free'
                  : '${coursePrice.toStringAsFixed(0)} MMK',
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
                          ? _displaySuccessfulSnackBar(
                              context,
                              "You have successfully enrolled the course.",
                              2000,
                            )
                          : _displayPaymentBottomSheet();
                    },
                    text: widget.course.courseType == CourseType.free
                        ? 'Free Enroll'
                        : 'Buy Now',
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
                        _displaySuccessfulSnackBar(
                          context,
                          "Removed course from the wishlist.",
                          1200,
                        );
                        //Todo: .delete
                        setState(() {
                          boxCourses.delete('key_${widget.course.courseId}');
                        });
                      } else {
                        _displaySuccessfulSnackBar(
                          context,
                          "Added course to the wishlist.",
                          1200,
                        );
                        //Todo: .put
                        setState(() {
                          boxCourses.put(
                            'key_${widget.course.courseId}',
                            Course(
                              courseId: widget.course.courseId,
                              courseType: widget.course.courseType,
                              courseImage: widget.course.courseImage,
                              courseName: widget.course.courseName,
                              coursePriceInMMK: widget.course.coursePriceInMMK,
                              courseTotalDurationInHour:
                                  widget.course.courseTotalDurationInHour,
                              courseInstructorImage:
                                  widget.course.courseInstructorImage,
                              courseInstructorName:
                                  widget.course.courseInstructorName,
                              courseInstructorMajor:
                                  widget.course.courseInstructorMajor,
                              courseInstructorDescription:
                                  widget.course.courseInstructorDescription,
                              courseLanguageCategory:
                                  widget.course.courseLanguageCategory,
                              courseLevel: widget.course.courseLevel,
                              courseSkill: widget.course.courseSkill,
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
            child: const Text(
              'Course Content',
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
                              isExpanded == true ? Icons.remove : Icons.add,
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
