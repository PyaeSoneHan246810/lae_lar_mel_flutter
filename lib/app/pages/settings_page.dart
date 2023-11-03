import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/welcome_page.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    bool isSwitched = themeModeProvider.isDarkThemeEnabled;
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.settings,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: FadeInLeft(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.language_rounded),
                title: Text(
                  AppLocalizations.of(context)!.app_language,
                  style: AppFontStyle.bodyOffBlack(context),
                ),
                trailing: SizedBox(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (provider.locale == const Locale('en'))
                            ? 'English'
                            : 'မြန်မာစာ',
                        style: AppFontStyle.bodyOffBlack(context),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  displayLanguagePickerSheet(context, false);
                },
              ),
              SwitchListTile(
                contentPadding: const EdgeInsets.all(0),
                secondary: const Icon(Icons.dark_mode_rounded),
                title: Text(
                  'Dark Theme',
                  style: AppFontStyle.bodyOffBlack(context),
                ),
                value: isSwitched,
                activeColor: AppColor.primaryColor,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                  themeModeProvider.toggleTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
