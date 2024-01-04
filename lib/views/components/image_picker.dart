import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class ImagePicker extends StatelessWidget {
  final VoidCallback onPickImage;
  const ImagePicker({
    super.key,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.elliptical(100.w, 100.w),
              color: AppColors.secondary,
              dashPattern: const [4, 4],
              strokeCap: StrokeCap.butt,
              strokeWidth: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(100.w, 100.w),
                ),
                child: Container(
                  height: 100.w,
                  width: 100.w,
                  color: AppColors.primaryLight,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(33.0),
                child: SvgPicture.asset(
                  AppAssets.camera,
                  height: 26.w,
                  width: 26.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
