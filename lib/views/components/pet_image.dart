import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/models.dart';
import "../../helper/helpers.dart";
import '../../theme/theme.dart';

class PetImage extends StatelessWidget {
  const PetImage({
    super.key,
    required this.itemBean,
    this.customSize,
  });

  final PetItemBean itemBean;
  final double? customSize;

  @override
  Widget build(BuildContext context) {
    bool haveImage = false;
    String imagePath = "";

    if (itemBean.petProfilePhoto != null) {
      imagePath = itemBean.fullProfileImageUrl.toString();
      haveImage = imagePath.hasValidUrl();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.sp),
      child: !haveImage
          ? Image.asset(
              AppAssets.launcherIcon,
              height: customSize ?? 65.w,
              width: customSize ?? 65.w,
              fit: BoxFit.cover,
            )
          : CachedNetworkImage(
              imageUrl: imagePath,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 60),
              fadeInCurve: Curves.easeIn,
              height: customSize ?? 65.w,
              width: customSize ?? 65.w,
            ),
    );
  }
}
