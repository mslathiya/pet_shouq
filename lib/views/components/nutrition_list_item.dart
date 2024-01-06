import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pet_shouq/config/config.dart';
import 'package:pet_shouq/views/components/components.dart';

import '../../theme/theme.dart';

class NutritionListItem extends StatelessWidget {
  final VoidCallback onViewDetail;
  final ApplicationLocalizations t;
  const NutritionListItem({
    super.key,
    required this.onViewDetail,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.sp,
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Text(
                    'Premium Puppy Chow',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.sp, height: 2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  child: Wrap(
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
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '\$1.50\n',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                        height: 1.3,
                      ),
                  children: [
                    TextSpan(
                      text: t.translate("per_pound"),
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.secondary,
                              ),
                    ),
                  ],
                ),
              ),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: InkWell(
                  onTap: onViewDetail,
                  child: Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.sp),
                      ),
                      color: AppColors.primary.withOpacity(0.4),
                    ),
                    child: Icon(
                      Entypo.chevron_right,
                      size: 18.sp,
                      color: AppColors.fontMain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8.w,
          ),
        ],
      ),
    );
  }
}
