import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../providers/reward_points_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_separator.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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

  Future<void> showAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          final themeModeProvider =
              Provider.of<ThemeModeProvider>(context, listen: false);
          final authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          return AlertDialog(
            backgroundColor: themeModeProvider.themeMode == ThemeMode.light
                ? AppColor.lightestBlueColor
                : AppColor.darkGreyLight2,
            title: Text(
              AppLocalizations.of(context)!.sign_out,
              style: AppFontStyle.alertTitleOffBlack(context),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    AppLocalizations.of(context)!.sign_out_text,
                    style: AppFontStyle.alertTextOffBlack(context),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  authProvider.userSignOut().then((value) {
                    Navigator.pushNamed(context, 'welcomePage');
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context)!.sign_out_yes,
                  style: AppFontStyle.navTextPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context)!.sign_out_no,
                  style: AppFontStyle.navTextOffBlack(context),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final rewardPointsProvider = Provider.of<RewardPointsProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.account,
        isSearchIconVisible: false,
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadeInDown(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: themeModeProvider.themeMode == ThemeMode.light
                          ? AppColor.primaryColor
                          : AppColor.darkGrey,
                      width: double.infinity,
                      height: 250,
                    ),
                    Positioned(
                      top: 20,
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
                                      image: authProvider.userModel.profilePic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: AppColor.greyColor,
                          backgroundImage: NetworkImage(
                            authProvider.userModel.profilePic,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            authProvider.userModel.name,
                            style: AppFontStyle.title1PureWhite,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star_outline_rounded,
                                color: AppColor.pureWhiteColor,
                                size: 18,
                              ),
                              const CustomSeparator(
                                width: 4,
                                height: 0,
                              ),
                              Text(
                                rewardPointsProvider.rewardPoints.toString(),
                                style: AppFontStyle.bodyPureWhite,
                              ),
                              const CustomSeparator(
                                width: 4,
                                height: 0,
                              ),
                              const Text(
                                'Reward Points',
                                style: AppFontStyle.bodyPureWhite,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('editProfilePage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.edit_profile,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('settingsPage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('rewardPointsPage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.reward_points,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('rewardPointsExchangePage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.exchange_reward,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomSeparator(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.help_and_support,
                        style: AppFontStyle.captionSmallOffBlack(context),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('aboutUsPage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.about_us,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('contactUsPage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.contact_us,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('faqPage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.faq,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Share.share(
                      'လေ့လာမယ်ဟာ အရည်အချင်းပြည့်မှီသော ဆရာဆရာမများမှ သင်ကြားပို့ချသည့် ဘာသာစကား video courses များကို ၀ယ်ယူရရှိနိုင်ပြီး ကျောင်းသားကျောင်းသူများ လွယ်ကူအဆင်ပြေချောမွေ့စွာ မိမိလေ့လာလိုသောဘာသာစကားများကို အချိန်နေရာမရွေး ဈေးနှုန်းသက်သာစွာ ၀ယ်ယူလေ့လာနိုင်မည့် အဆင့်မြင့် e-learning mobile application platform တစ်ခုပဲဖြစ်ပါတယ်။\nLaeLarMel is the e-learning mobile application platform, offering language courses that include both free and paid options, taught by skilled instructors.\nThe application is available for both Android and iOS. Download the app now to start improving your language skills with us. https://linktr.ee/laelarmel',
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.share_app,
                          style: AppFontStyle.bodyOffBlack(context),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: TextButton(
                    onPressed: () {
                      showAlertDialog();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.sign_out,
                      style: AppFontStyle.navTextPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    'v.1.0.0',
                    style: AppFontStyle.captionSmallOffBlack(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
