import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import '../config/font_styles.dart';
import '../providers/theme_mode_provider.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  final BuildContext context;

  CustomAppBar({
    required this.titleText,
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
                      final themeModeProvider = Provider.of<ThemeModeProvider>(
                          context,
                          listen: false);
                      displayLanguagePickerSheet(context, false);
                    },
                    icon: const Icon(
                      Icons.language_rounded,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}
