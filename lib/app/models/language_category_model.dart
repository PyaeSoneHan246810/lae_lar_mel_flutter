class LanguageCategoryModel {
  String languageFlagPath;
  String languageName;
  String pageRouteName;
  LanguageCategoryModel({
    required this.languageFlagPath,
    required this.languageName,
    required this.pageRouteName,
  });
  static List<LanguageCategoryModel> getLanguageCategories() {
    List<LanguageCategoryModel> languageCategories = [];
    languageCategories.add(LanguageCategoryModel(
      languageFlagPath: 'assets/images/uk_flag.svg',
      languageName: 'English',
      pageRouteName: 'englishCoursesPage',
    ));
    languageCategories.add(LanguageCategoryModel(
      languageFlagPath: 'assets/images/china_flag.svg',
      languageName: 'Chinese',
      pageRouteName: 'chineseCoursesPage',
    ));
    languageCategories.add(LanguageCategoryModel(
      languageFlagPath: 'assets/images/japan_flag.svg',
      languageName: 'Japanese',
      pageRouteName: 'japaneseCoursesPage',
    ));
    languageCategories.add(LanguageCategoryModel(
      languageFlagPath: 'assets/images/south_korea_flag.svg',
      languageName: 'Korean',
      pageRouteName: 'koreanCoursesPage',
    ));
    return languageCategories;
  }
}
