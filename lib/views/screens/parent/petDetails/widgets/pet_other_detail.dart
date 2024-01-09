import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetOtherDetails extends StatelessWidget {
  const PetOtherDetails({
    super.key,
    required this.localizations,
  });

  final ApplicationLocalizations localizations;

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
        vertical: 5.sp,
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
      child: ListTileTheme(
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
            localizations.translate("pet_other_details"),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          children: [
            InfoLabel(
              title: localizations.translate("chip_number"),
              description: '900133000003382',
            ),
            InfoLabel(
              title: localizations.translate("spayed"),
              description: 'Yes',
            ),
            InfoLabel(
              title: localizations.translate("pedigree_front"),
              description: 'Lorem ipsum',
            ),
            InfoLabel(
              title: localizations.translate("pedigree_back"),
              description: 'Lorem ipsum',
            ),
            InfoLabel(
              title: localizations.translate("allergies"),
              description: 'Lorem ipsum',
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 5.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    localizations.translate("description"),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the of printing and typesetting industry. Lorem by Ipsum has been the industry's standard ",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.gray,
                          fontSize: 13.sp,
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
