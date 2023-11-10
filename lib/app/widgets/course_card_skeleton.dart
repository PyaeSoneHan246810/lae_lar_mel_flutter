import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:shimmer/shimmer.dart';

class CourseCardSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Container(
                    height: 16,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  height: 16,
                  width: 60,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Container(
                  height: 14,
                  width: 80,
                  color: Colors.grey[300],
                ),
                const CustomSeparator(
                  width: 8,
                  height: 0,
                ),
                Container(
                  height: 14,
                  width: 60,
                  color: Colors.grey[300],
                ),
                const CustomSeparator(
                  width: 8,
                  height: 0,
                ),
                Container(
                  height: 14,
                  width: 80,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
