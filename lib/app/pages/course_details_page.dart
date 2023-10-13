import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:animate_do/animate_do.dart';

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
  bool _isPlayArrowClicked = false;
  bool _isInstructorExpansionPanelExpanded = false;
  late FlickManager _flickManager;
  late List<bool> _isExpandedList;

  @override
  void initState() {
    super.initState();
    _flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(widget.course.coursePreviewVideo),
    );
    _isExpandedList = List.generate(
        widget.course.courseSections.length, (index) => index == 0);
  }

  void _toggleExpansionState(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  void _onExpansionChanged(int index, bool isExpanded) {
    setState(() {
      _isExpandedList[index] = isExpanded;
    });
  }

  Future<void> _displaySuccessfulSnackBar(BuildContext context) async {
    // Create a Completer to represent the completion of the future
    final Completer<void> completer = Completer<void>();

    ScaffoldMessenger.of(context)
        .showSnackBar(
          const SnackBar(
            backgroundColor: AppColor.primaryColor,
            showCloseIcon: true,
            closeIconColor: AppColor.pureWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            content: Text(
              'You have successfully enrolled the course.',
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

  Future _displayPaymentBottomSheet() {
    return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
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
                    'Total - ',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  Text(
                    widget.course.coursePrice,
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                ],
              ),
              const CustomSeparator(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount - ',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  Text(
                    '0 MMK',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                ],
              ),
              const CustomSeparator(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Grand Total - ',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  Text(
                    widget.course.coursePrice,
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
                ],
              ),
              const CustomSeparator(height: 12),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'More payment options',
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
                  _displaySuccessfulSnackBar(context);
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
      child: SizedBox(
        height: 210,
        child: FlickVideoPlayer(
          flickManager: _flickManager,
        ),
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
              height: 210,
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
                Icons.play_arrow,
                size: 120,
                color: AppColor.pureWhiteColor,
              ),
              onPressed: () {
                setState(() {
                  _isPlayArrowClicked = !_isPlayArrowClicked;
                  if (_isPlayArrowClicked) {
                    _flickManager.flickControlManager?.togglePlay();
                  }
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
              courseMaterial.duration != null
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
                          courseMaterial.duration!,
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
    return Scaffold(
      appBar: CustomAppBarWithBackArrowWithoutTitle(
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
                      '${widget.course.courseTotalDurationInHours} hours',
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
              widget.course.coursePrice,
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
                          ? _displaySuccessfulSnackBar(context)
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
                    onPressed: () {},
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
