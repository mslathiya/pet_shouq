import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/config/route.config.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class DietInfo extends StatelessWidget {
  const DietInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: 65.w,
                  width: 65.w,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rimadyl',
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
                        const LabelWithIcon(
                          asset: AppAssets.icCalendar,
                          value: '2023-10-15',
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const LabelWithIcon(
                          asset: AppAssets.icWaterGlass,
                          value: 'Yes',
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
            onPressEdit: () => Navigator.pushNamed(context, petAddDiet),
          ),
        ],
      ),
    );
  }
}
