import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageCategoryModel {
  String languageCountryCode;
  String languageName;
  String pageRouteName;
  LanguageCategoryModel({
    required this.languageCountryCode,
    required this.languageName,
    required this.pageRouteName,
  });
  static List<LanguageCategoryModel> getLanguageCategories(
      BuildContext context) {
    List<LanguageCategoryModel> languageCategories = [];
    languageCategories.add(LanguageCategoryModel(
      languageCountryCode: 'GB',
      languageName: AppLocalizations.of(context)!.english,
      pageRouteName: 'englishCoursesPage',
    ));
    languageCategories.add(LanguageCategoryModel(
      languageCountryCode: 'CN',
      languageName: AppLocalizations.of(context)!.chinese,
      pageRouteName: 'chineseCoursesPage',
    ));
    languageCategories.add(LanguageCategoryModel(
      languageCountryCode: 'JP',
      languageName: AppLocalizations.of(context)!.japanese,
      pageRouteName: 'japaneseCoursesPage',
    ));
    languageCategories.add(LanguageCategoryModel(
      languageCountryCode: 'KR',
      languageName: AppLocalizations.of(context)!.korean,
      pageRouteName: 'koreanCoursesPage',
    ));
    return languageCategories;
  }
}
