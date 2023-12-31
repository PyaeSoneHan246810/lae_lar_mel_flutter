import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../providers/auth_provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: FadeInDown(
                  child: Column(
                    children: [
                      const CustomSeparator(height: 10),
                      Text(
                        AppLocalizations.of(context)!.intro_title,
                        style: AppFontStyle.headerPrimary,
                      ),
                      const CustomSeparator(height: 10),
                      Text(
                        AppLocalizations.of(context)!.intro_subtitle,
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                      const CustomSeparator(height: 70),
                      Center(
                        child: Image.asset(
                          'assets/images/intro_illustration.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FadeInUp(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomFilledButton(
                              onPressed: () async {
                                if (authProvider.isSignedIn == true) {
                                  await authProvider
                                      .getUserDataFromSharedPreferences()
                                      .whenComplete(() {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      'rootPage',
                                      (route) => false,
                                    );
                                  });
                                } else {
                                  Navigator.of(context)
                                      .pushNamed('phoneNumberPage');
                                }
                              },
                              text:
                                  AppLocalizations.of(context)!.getting_started,
                            ),
                          ),
                        ],
                      ),
                      const CustomSeparator(height: 20),
                      GestureDetector(
                        onTap: () {
                          displayLanguagePickerSheet(context, true);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.g_translate_rounded,
                              color: AppColor.offBlackColor,
                              size: 24,
                            ),
                            const CustomSeparator(
                              height: 0,
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)!.select_language,
                              style: AppFontStyle.bodyNavTextOffBlack(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> displayLanguagePickerSheet(
    BuildContext context, bool isMessageVisible) async {
  return showModalBottomSheet(
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Center(
              child: Text(
                AppLocalizations.of(context)!.select_app_language,
                style: AppFontStyle.alertTitlePrimary,
                textAlign: TextAlign.center,
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            ListTile(
              leading: CountryFlag.fromCountryCode(
                'GB',
                width: 40,
              ),
              iconColor: AppColor.lightBlackColor,
              titleTextStyle: AppFontStyle.alertTextOffBlack(context),
              horizontalTitleGap: 12,
              title: Text(
                AppLocalizations.of(context)!.english_language,
                style: AppFontStyle.bodyOffBlack(context),
              ),
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);
                provider.setLocale(const Locale('en'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: CountryFlag.fromCountryCode(
                'MM',
                width: 40,
              ),
              iconColor: AppColor.lightBlackColor,
              titleTextStyle: AppFontStyle.alertTextOffBlack(context),
              horizontalTitleGap: 12,
              title: Text(
                AppLocalizations.of(context)!.burmese_language,
                style: AppFontStyle.bodyOffBlack(context),
              ),
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);
                provider.setLocale(const Locale('my'));
                Navigator.of(context).pop();
              },
            ),
            Visibility(
              visible: isMessageVisible,
              child: Column(
                children: [
                  const CustomSeparator(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "You can change it later if you want",
                      style: AppFontStyle.bodyOffBlack(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
