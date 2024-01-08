import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class NutritionPrice extends StatelessWidget {
  const NutritionPrice({
    super.key,
    required this.t,
    required this.onPress,
  });

  final VoidCallback onPress;

  final ApplicationLocalizations t;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
        top: 10.sp,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '\$1.50\n',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.secondary,
                    height: 1.3,
                  ),
              children: [
                TextSpan(
                  text: t.translate("per_pound"),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.secondary,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.h,
          ),
          Align(
            alignment: Alignment.center,
            child: ButtonView(
              onTap: onPress,
              buttonTitle: t.translate("edit_details"),
              width: 180.w,
            ),
          ),
        ],
      ),
    );
  }
}
