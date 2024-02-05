import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../config/config.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class MedicationInfo extends StatelessWidget {
  const MedicationInfo({
    super.key,
  });

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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 67.w,
                  width: 67.w,
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
                          asset: AppAssets.icDoctor,
                          value: 'Whiskers',
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const LabelWithIcon(
                          asset: AppAssets.icPetPaw,
                          value: 'Tablet',
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Flexible(
                              child: LabelWithIcon(
                                asset: AppAssets.icDocBag,
                                value: 'Dog',
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            const Flexible(
                              child: LabelWithIcon(
                                asset: AppAssets.icStethoscope,
                                value: 'Dr.Smith',
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: EditButton(
              onPressEdit: () => Get.offNamed(petAddMedication),
            ),
          )
        ],
      ),
    );
  }
}
