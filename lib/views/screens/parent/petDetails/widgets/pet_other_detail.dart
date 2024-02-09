import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models.dart';
import '../../../../../helper/helpers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetOtherDetails extends StatelessWidget {
  const PetOtherDetails({
    super.key,
    required this.info,
  });

  final PetInformation info;

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      childWidget: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0.0,
        horizontalTitleGap: 0,
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: true,
          collapsedShape: const Border(),
          shape: const Border(),
          iconColor: AppColors.fontMain,
          title: Text(
            "pet_other_details".tr,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          children: [
            if (CommonHelper.isNotEmpty(info.petMicrochipNumber))
              InfoLabel(
                title: "chip_number".tr,
                description: info.petMicrochipNumber ?? "",
                padding: EdgeInsets.only(bottom: 5.h),
              ),
            if (CommonHelper.isNotEmpty(info.petIsNeutered))
              InfoLabel(
                title: "spayed".tr,
                description: info.petIsNeutered ?? "",
                padding: EdgeInsets.only(bottom: 5.h),
              ),
            if (CommonHelper.isNotEmpty(info.petPedigreeInfoFrontside))
              InfoLabel(
                title: "pedigree_front".tr,
                description: info.petPedigreeInfoFrontside ?? "",
                padding: EdgeInsets.only(bottom: 5.h),
              ),
            if (CommonHelper.isNotEmpty(info.petPedigreeInfoBackside))
              InfoLabel(
                title: "pedigree_back".tr,
                description: info.petPedigreeInfoBackside ?? "",
                padding: EdgeInsets.only(bottom: 5.h),
              ),
            if (CommonHelper.isNotEmpty(info.petAllergies))
              InfoLabel(
                title: "allergies".tr,
                description: info.petAllergies ?? "",
                padding: EdgeInsets.only(bottom: 5.h),
              ),
            if (CommonHelper.isNotEmpty(info.petDescription))
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "description".tr,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      info.petDescription ?? "",
                      textAlign: TextAlign.justify,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.gray,
                                fontSize: 12.sp,
                              ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
