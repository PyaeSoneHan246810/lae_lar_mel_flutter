import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../providers/theme_mode_provider.dart';
import 'custom_course_view_skeleton.dart';

class CourseViewShimmer extends StatelessWidget {
  const CourseViewShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    return Shimmer.fromColors(
      baseColor: themeModeProvider.themeMode == ThemeMode.light
          ? Colors.grey[300]!
          : Colors.grey[900]!,
      highlightColor: themeModeProvider.themeMode == ThemeMode.light
          ? Colors.grey[100]!
          : Colors.grey[600]!,
      child: CourseViewSkeleton(),
    );
  }
}
