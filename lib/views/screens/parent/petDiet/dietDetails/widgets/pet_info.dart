import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/config.dart';
import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({super.key, required this.itemBean});
  final DietDetailBean? itemBean;

  @override
  Widget build(BuildContext context) {
    if (itemBean == null) {
      return const SizedBox();
    }

    PetItemBean bean = itemBean!.pet!;

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PetImage(
                  itemBean: bean,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itemBean?.dietFoodName ?? "",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        LabelWithIcon(
                          asset: AppAssets.icCalendar,
                          value: itemBean!.dietDate != null
                              ? DateFormat("dd/MM/yyyy")
                                  .format(itemBean!.dietDate!)
                              : "",
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        LabelWithIcon(
                          asset: AppAssets.icWaterGlass,
                          value: itemBean!.dietWater ?? "",
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          EditButton(
            onPressEdit: () => Get.offNamed(
              petAddDiet,
              arguments: [
                {
                  "mode": "Edit",
                },
                {"info": itemBean}
              ],
            ),
          ),
        ],
      ),
    );
  }
}
