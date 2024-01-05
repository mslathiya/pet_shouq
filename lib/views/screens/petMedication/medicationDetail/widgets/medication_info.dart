import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                              ?.copyWith(fontSize: 16.sp),
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
                                asset: AppAssets.icPetPaw,
                                value: 'Whiskers',
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            const Flexible(
                              child: LabelWithIcon(
                                asset: AppAssets.icDocBag,
                                value: 'Tablet',
                              ),
                            ),
                          ],
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
                                asset: AppAssets.icStethoscope,
                                value: 'Dog',
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            const Flexible(
                              child: LabelWithIcon(
                                asset: AppAssets.icDoctor,
                                value: 'Dr.Smith',
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
            child: Material(
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppAssets.icEdit,
                  height: 42.sp,
                  width: 42.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
