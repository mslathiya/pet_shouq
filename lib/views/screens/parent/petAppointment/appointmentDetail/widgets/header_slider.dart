import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';

class HeaderSlider extends StatelessWidget {
  final String imageSource;

  const HeaderSlider({
    super.key,
    required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 175.h,
        autoPlay: false,
        pageSnapping: true,
        viewportFraction: 1,
        enlargeCenterPage: false,
      ),
      items: [1].map((i) {
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
                borderRadius: BorderRadius.all(
                  Radius.circular(10.sp),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 1, right: 1),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.sp),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageSource,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
