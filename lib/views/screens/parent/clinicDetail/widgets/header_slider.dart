import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class HeaderSlider extends StatelessWidget {
  String imagePath;
   HeaderSlider({super.key,required this.imagePath});

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
                  child:  CachedNetworkImage(
                    imageUrl: imagePath,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 60),
                    fadeInCurve: Curves.easeIn,
                    height: 95.h,
                    width: 95.h,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 95.h,
                      width: 95.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // child: Image.asset(
                  //   AppAssets.doctorBanner,
                  //   height: double.maxFinite,
                  //   width: double.maxFinite,
                  //   fit: BoxFit.cover,
                  // ),
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
