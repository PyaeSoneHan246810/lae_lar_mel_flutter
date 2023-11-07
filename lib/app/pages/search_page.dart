import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import '../config/font_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
          child: Text(
            AppLocalizations.of(context)!.search,
            style: AppFontStyle.navTextOffBlack(context),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 24,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSeparator(
              height: 20,
              width: 0,
            ),
            FadeInLeft(
              child: Text(
                AppLocalizations.of(context)!.app_language,
                style: AppFontStyle.subtitleOffBlack(context),
              ),
            ),
            const CustomSeparator(
              height: 20,
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'englishCoursesPage');
              },
              child: FadeInLeft(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.english,
                      style: AppFontStyle.bodyNavTextOffBlack(context),
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
              height: 14,
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'chineseCoursesPage');
              },
              child: FadeInLeft(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.chinese,
                      style: AppFontStyle.bodyNavTextOffBlack(context),
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
              height: 14,
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'japaneseCoursesPage');
              },
              child: FadeInLeft(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.japanese,
                      style: AppFontStyle.bodyNavTextOffBlack(context),
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
              height: 14,
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'koreanCoursesPage');
              },
              child: FadeInLeft(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.korean,
                      style: AppFontStyle.bodyNavTextOffBlack(context),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'English',
    'Chinese',
    'Japanese',
    'Korean',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(
          Icons.arrow_back_rounded,
          size: 24,
        ),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear_rounded,
            size: 24,
          ),
        )
      ];

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchTerm in searchTerms) {
      if (searchTerm.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchTerm);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchTerms.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    if (query.isNotEmpty) {
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(
              suggestion,
              style: AppFontStyle.navTextOffBlack(context),
            ),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
