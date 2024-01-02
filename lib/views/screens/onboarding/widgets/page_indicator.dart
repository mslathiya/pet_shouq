import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../theme/theme.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final Function(int) onDotClicked;
  final int length;
  const PageIndicator({
    super.key,
    required this.controller,
    required this.onDotClicked,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: length,
      effect: WormEffect(
        dotColor: AppColors.secondary.withOpacity(0.30),
        activeDotColor: AppColors.secondary,
        dotHeight: 12.sp,
        dotWidth: 12.sp,
      ),
      axisDirection: Axis.horizontal,
      onDotClicked: (index) => onDotClicked(index),
    );
  }
}
