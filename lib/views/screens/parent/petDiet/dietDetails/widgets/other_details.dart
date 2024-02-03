import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({
    super.key,
    this.itemBean,
  });

  final DietDetailBean? itemBean;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 10.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.fontMain.withOpacity(0.13),
            blurRadius: 5.sp,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoLabel(
            title: "food_type".tr,
            description: itemBean?.dietFoodName ?? "",
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "portion_size".tr,
            description: itemBean?.dietPortionSize ?? "",
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "special_instruction".tr,
            description: itemBean?.dietSpecialInstructions ?? "",
            padding: EdgeInsets.only(bottom: 5.h),
          ),
          InfoLabel(
            title: "weight".tr,
            description: itemBean?.dietWeight ?? "",
            padding: EdgeInsets.only(bottom: 5.h),
          ),
        ],
      ),
    );
  }
}
