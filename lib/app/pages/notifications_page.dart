import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/notifications_course_info_page.dart';
import 'package:lae_lar_mel_app/app/pages/notifications_featured_page.dart';
import 'package:lae_lar_mel_app/app/pages/notifications_promotions_page.dart';
import 'package:lae_lar_mel_app/app/pages/notifications_software_updates_page.dart';
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
            TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context)!.featured),
                Tab(text: AppLocalizations.of(context)!.course_info),
                Tab(text: AppLocalizations.of(context)!.promotions),
                Tab(text: AppLocalizations.of(context)!.software_updates),
              ],
              isScrollable: true,
              indicatorColor: AppColor.primaryColor,
              labelStyle: AppFontStyle.tabNavText,
              labelPadding: const EdgeInsets.only(left: 18, right: 18),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NotificationsFeaturedPage(),
                  NotificationsCourseInfoPage(),
                  NotificationsPromotionsPage(),
                  NotificationsSoftwareUpdatesPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
