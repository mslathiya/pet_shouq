import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../config/config.dart';
import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({
    super.key,
    required this.info,
  });
  final VaccinationDetail info;

  @override
  Widget build(BuildContext context) {
    PetItemBean bean = info.pet!;

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
                          info.vacName ?? "",
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
                          asset: AppAssets.icDoctor,
                          value: info.vacProvider ?? "",
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        LabelWithIcon(
                          asset: AppAssets.icPetPaw,
                          value: info.vacType ?? "",
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: LabelWithIcon(
                                asset: AppAssets.icDocBag,
                                value: info.vacPetSpecies ?? "",
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            Flexible(
                              child: LabelWithIcon(
                                asset: AppAssets.icCalendar,
                                value: info.vacProvider ?? "",
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
              onPressEdit: () => Get.offNamed(
                petAddVaccination,
                arguments: [
                  {
                    "mode": "Edit",
                  },
                  {"info": info}
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
