import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.headerView,
          height: 280.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppAssets.headerAsset,
          height: 190.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 40,
          child: Image.asset(
            AppAssets.appLogo,
            height: 110.h,
            width: 165.w,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
