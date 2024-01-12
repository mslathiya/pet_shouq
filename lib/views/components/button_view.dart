import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ButtonView extends StatefulWidget {
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
    this.isLoading = false,
  });

  final double? width;
  final VoidCallback onTap;
  final String buttonTitle;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? buttonColor;
  final TextStyle? buttonStyle;
  final bool? isBordered;
  final bool? isLoading;

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
      width: widget.isLoading! ? 52.sp : widget.width!,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Material(
          child: InkWell(
            child: Container(
              height: 52.sp,
              width: widget.isLoading == true ? 52.sp : widget.width!,
              decoration: BoxDecoration(
                color: widget.buttonColor ?? AppColors.secondary,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.4),
                    blurRadius: 5.sp,
                    offset: const Offset(1, 2),
                  )
                ],
                border: widget.isBordered == true
                    ? Border.all(
                        color: AppColors.secondary,
                        width: 1,
                      )
                    : const Border(),
                borderRadius: widget.isLoading == true
                    ? BorderRadius.all(
                        Radius.elliptical(100.sp, 100.sp),
                      )
                    : BorderRadius.all(
                        Radius.circular(12.sp),
                      ),
              ),
              child: FittedBox(
                child: Padding(
                  padding: widget.isLoading == true
                      ? EdgeInsets.all(8.sp)
                      : EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                  child: widget.isLoading!
                      ? const CircularProgressIndicator(
                          strokeWidth: 3,
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.leftWidget ?? const SizedBox(),
                            Text(
                              widget.buttonTitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: AppColors.white,
                                    fontSize: 7.sp,
                                    height: 1.2,
                                  )
                                  .merge(widget.buttonStyle),
                            ),
                            widget.rightWidget ?? const SizedBox()
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
