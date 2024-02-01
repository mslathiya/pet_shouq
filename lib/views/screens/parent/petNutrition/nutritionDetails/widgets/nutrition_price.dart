import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class NutritionPrice extends StatelessWidget {
  const NutritionPrice({
    super.key,
    required this.onPress,
    required this.info,
  });

  final VoidCallback onPress;
  final NutritionData info;
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
              text: '\$${info.nutPrice}\n',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.secondary,
                    height: 1.3,
                  ),
              children: [
                TextSpan(
                  text: "per_pound".tr,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 12.sp,
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
              buttonTitle: "edit_details".tr,
              width: 180.w,
              buttonStyle: TextStyle(
                fontSize: 7.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
