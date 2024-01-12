import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class CircleIndicator extends StatelessWidget {
  final double percent;
  final int activePage;
  final int totalPage;
  final VoidCallback onPressNext;
  final VoidCallback onPressSkip;
  final VoidCallback onAnimationEnd;

  const CircleIndicator({
    super.key,
    required this.percent,
    required this.activePage,
    required this.totalPage,
    required this.onPressNext,
    required this.onPressSkip,
    required this.onAnimationEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 68.w,
          height: 68.w,
          child: CircleProgressBar(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.secondary,
            value: percent,
            onAnimationEnd: onAnimationEnd,
          ),
        ),
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: IconButton(
            onPressed: () {
              activePage != totalPage - 1 ? onPressNext() : onPressSkip();
            },
            icon: SvgPicture.asset(
              AppAssets.arrowRight,
              height: 26,
            ),
            iconSize: 40.sw,
          ),
        )
      ],
    );
  }
}
