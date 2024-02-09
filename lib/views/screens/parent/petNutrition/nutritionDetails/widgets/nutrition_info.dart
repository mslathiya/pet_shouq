import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class NutritionInfo extends StatelessWidget {
  const NutritionInfo({
    super.key,
    required this.info,
  });
  final NutritionData info;

  @override
  Widget build(BuildContext context) {
    PetItemBean bean = info.pet!;

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
        top: 5.sp,
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
          PetImage(
            itemBean: bean,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    info.nutFoodName ?? "",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 14.sp),
                  ),
                  LabelWithIcon(
                    asset: AppAssets.icBestProduct,
                    value: info.nutBrand ?? "",
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  LabelWithIcon(
                    asset: AppAssets.icBreedType,
                    value: info.nutFoodName ?? "",
                    padding: EdgeInsets.zero,
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
                        width: 70.sp,
                        child: LabelWithIcon(
                          asset: AppAssets.icDocBag,
                          value: info.nutLifeStage ?? "",
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SizedBox(
                        width: 160.sp,
                        child: LabelWithIcon(
                          asset: AppAssets.icFoodType,
                          value: info.nutFoodType ?? "",
                          padding: EdgeInsets.zero,
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
