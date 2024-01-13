import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.onPressEdit,
  });
  final VoidCallback onPressEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressEdit,
        child: SvgPicture.asset(
          AppAssets.icEdit,
          height: 36.sp,
          width: 36.sp,
        ),
      ),
    );
  }
}
