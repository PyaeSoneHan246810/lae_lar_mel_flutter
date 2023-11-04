import 'package:flutter/material.dart';
import '../config/font_styles.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  final bool isSearchIconVisible;
  final BuildContext context;

  CustomAppBar({
    required this.titleText,
    required this.isSearchIconVisible,
    required this.context,
    Key? key,
  }) : super(
          key: key,
          elevation: 2,
          toolbarHeight: 60,
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              titleText,
              style: AppFontStyle.headerPrimary,
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isSearchIconVisible,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('searchPage');
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        size: 28,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('wishlistPage');
                    },
                    icon: const Icon(
                      Icons.favorite_rounded,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('notificationsPage');
                    },
                    icon: const Icon(
                      Icons.notifications_rounded,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}
