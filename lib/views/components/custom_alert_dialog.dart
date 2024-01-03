import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'button_view.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? topIcon;
  final String label;
  final String? subLabel;
  final String buttonText;
  final VoidCallback onPressButton;

  const CustomAlertDialog({
    super.key,
    this.topIcon,
    required this.label,
    this.subLabel,
    required this.buttonText,
    required this.onPressButton,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16.sp),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15.h,
              ),
              topIcon != null
                  ? SvgPicture.asset(
                      topIcon!,
                      height: 80.h,
                      width: 80.w,
                    )
                  : Container(),
              SizedBox(
                height: 25.h,
              ),
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ),
              subLabel != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          subLabel!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                height: 1.5,
                                letterSpacing: 0.20,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 15.h,
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () {
                    Navigator.of(context).pop();
                    onPressButton();
                  },
                  buttonTitle: buttonText,
                  width: 120.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
