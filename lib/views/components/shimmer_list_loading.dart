import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'list_placeholder.dart';
import 'shimmer_layout.dart';

class ShimmerListLoading extends StatelessWidget {
  const ShimmerListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
              .map(
                (e) => SizedBox(
                  height: 75.h,
                  width: double.infinity,
                  child: const ContentPlaceholder(
                    lineType: ContentLineType.threeLines,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
