import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/font_styles.dart';

class NotificationsCourseInfoPage extends StatefulWidget {
  const NotificationsCourseInfoPage({super.key});

  @override
  State<NotificationsCourseInfoPage> createState() =>
      _NotificationsCourseInfoPageState();
}

class _NotificationsCourseInfoPageState
    extends State<NotificationsCourseInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          children: [
            Center(
              child: Text(
                AppLocalizations.of(context)!.no_notifications,
                style: AppFontStyle.bodyLightBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
