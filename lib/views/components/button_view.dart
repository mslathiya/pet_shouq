import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ButtonView extends StatelessWidget {
  final double? width;
  final VoidCallback onTap;
  final String buttonTitle;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? buttonColor;
  final TextStyle? buttonStyle;
  final bool? isBordered;

  const ButtonView({
    super.key,
    this.width = 200,
    required this.onTap,
    required this.buttonTitle,
    this.leftWidget,
    this.rightWidget,
    this.buttonColor,
    this.buttonStyle,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.secondary,
        padding: EdgeInsets.all(12.w),
        elevation: 6,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.65),
        fixedSize: Size.fromWidth(width!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: isBordered!
              ? BorderSide(
                  color: AppColors.secondary,
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 3.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftWidget ?? const SizedBox(),
            Text(
              buttonTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  )
                  .merge(buttonStyle),
            ),
            rightWidget ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
