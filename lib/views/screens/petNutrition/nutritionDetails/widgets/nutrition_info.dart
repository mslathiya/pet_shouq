import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class NutritionInfo extends StatelessWidget {
  const NutritionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 10.sp,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
        top: 10.sp,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80.w,
            width: 80.w,
            decoration: BoxDecoration(
              color: AppColors.petType,
              borderRadius: BorderRadius.all(
                Radius.circular(15.sp),
              ),
            ),
            child: Center(
              child: Image.asset(
                AppAssets.typeDog,
                height: 36.sp,
                width: 36.sp,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Premium Puppy Chow',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 110.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icBestProduct,
                          value: 'ABC Pet Foods',
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SizedBox(
                        width: 110.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icBreedType,
                          value: 'Puppy',
                        ),
                      ),
                      SizedBox(
                        width: 110.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icDocBag,
                          value: 'Dog',
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SizedBox(
                        width: 110.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icFoodType,
                          value: 'Dry Kibble',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
