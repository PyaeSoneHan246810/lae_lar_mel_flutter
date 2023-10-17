import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';

import '../config/colors.dart';
import '../widgets/custom_appbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final String username = 'Pyae Sone Han';
  late TextEditingController _redeemCodeTextController;

  @override
  void initState() {
    super.initState();
    _redeemCodeTextController = TextEditingController();
  }

  @override
  void dispose() {
    _redeemCodeTextController.dispose();
    super.dispose();
  }

  Future<void> _displayEnterRedeemCodeAlertDialog() async {
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
            controller: _redeemCodeTextController,
            cursorColor: AppColor.primaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.greyColor,
              hintText: 'Type your redeem code',
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
                Navigator.of(context).pop();
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

  Future<void> showAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              'Sign out',
              style: AppFontStyle.alertTitle,
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    "Are you sure to log out of your account?",
                    style: AppFontStyle.alertText,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontFamily: 'Poppins',
                  ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Account',
        onBackButtonPressed: () {
          Navigator.pushNamed(context, 'wishlistPage');
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: FadeInDown(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: AppColor.primaryColor,
                    width: double.infinity,
                    height: 236,
                  ),
                  Positioned(
                    top: 30,
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
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image:
                                        'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                          height: 131,
                          width: 131,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Text(
                      username,
                      style: AppFontStyle.title1PureWhite,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('editProfilePage');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit profile',
                        style: AppFontStyle.bodyOffBlack,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: _displayEnterRedeemCodeAlertDialog,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Redeem code',
                        style: AppFontStyle.bodyOffBlack,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Help and Support',
                      style: AppFontStyle.captionSmallOffBlack,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('aboutUsPage');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About us',
                        style: AppFontStyle.bodyOffBlack,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('contactUsPage');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contact us',
                        style: AppFontStyle.bodyOffBlack,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('faqPage');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Frequently asked questions',
                        style: AppFontStyle.bodyOffBlack,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    Share.share(
                      'LaeLarMel is the e-learning mobile application platform, offering language courses that include both free and paid options, taught by skilled instructors. The application is available for both Android and iOS. Download the app now to start improving your language skills with us. https://linktr.ee/laelarmel',
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share our app',
                        style: AppFontStyle.bodyOffBlack,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: TextButton(
                  onPressed: () {
                    showAlertDialog();
                  },
                  child: const Text(
                    'Sign Out',
                    style: AppFontStyle.navTextPrimary,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'v.1.0.0',
                  style: AppFontStyle.captionSmallOffBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
