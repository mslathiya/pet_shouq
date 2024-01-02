import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ButtonView extends StatelessWidget {
  final double? width;
  final VoidCallback onTap;
  final String buttonTitle;

  const ButtonView({
    super.key,
    this.width = 200,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        padding: EdgeInsets.all(12.w),
        elevation: 6,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.65),
        fixedSize: Size.fromWidth(width!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.white,
                fontSize: 18.sp,
              ),
        ),
      ),
    );
  }
}
