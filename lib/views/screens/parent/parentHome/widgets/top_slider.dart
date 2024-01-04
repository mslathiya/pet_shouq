import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class TopSlider extends StatelessWidget {
  const TopSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 125.h,
        autoPlay: false,
        pageSnapping: true,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.fontMain.withOpacity(0.13),
                    blurRadius: 5.sp,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                AppAssets.sampleBanner,
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
