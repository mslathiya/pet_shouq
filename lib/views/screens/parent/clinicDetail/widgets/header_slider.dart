import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class HeaderSlider extends StatelessWidget {
  const HeaderSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 270,
        autoPlay: false,
        pageSnapping: true,
        viewportFraction: 1,
        enlargeCenterPage: false,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
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
                  margin: const EdgeInsets.only(left: 1, right: 1),
                  child: Image.asset(
                    AppAssets.doctorBanner,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 270,
                    decoration: BoxDecoration(
                      color: AppColors.fontMain.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
