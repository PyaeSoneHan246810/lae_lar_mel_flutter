import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.notifications,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Featured'),
                Tab(text: 'Course Info'),
                Tab(text: 'Promotions'),
                Tab(text: 'Software Updates'),
              ],
              isScrollable: true,
              indicatorColor: AppColor.primaryColor,
              labelStyle: AppFontStyle.tabNavText,
              labelPadding: EdgeInsets.only(left: 18, right: 18),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      'No notifications yet.',
                      style: AppFontStyle.bodyOffBlack(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
