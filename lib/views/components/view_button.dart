import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class ViewButton extends StatelessWidget {
  const ViewButton({
    super.key,
    required this.onPressView,
  });
  final VoidCallback onPressView;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressView,
        child: SvgPicture.asset(
          AppAssets.icViewDetails,
          height: 36.sp,
          width: 36.sp,
        ),
      ),
    );
  }
}
