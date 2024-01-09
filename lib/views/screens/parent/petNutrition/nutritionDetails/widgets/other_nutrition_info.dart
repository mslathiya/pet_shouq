import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/config.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class OtherNutritionInfo extends StatelessWidget {
  const OtherNutritionInfo({
    super.key,
    required this.t,
  });

  final ApplicationLocalizations t;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
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
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0.0,
        horizontalTitleGap: 0,
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(vertical: 8.sp),
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: true,
          collapsedShape: const Border(),
          shape: const Border(),
          iconColor: AppColors.fontMain,
          title: Text(
            t.translate("other_nutrition_detail"),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 16.sp),
          ),
          children: [
            InfoLabel(
              title: t.translate("nutrition_content"),
              description: "20g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("protein"),
              description: "28g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("fat"),
              description: "12g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("carbohydrates"),
              description: "48g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("fiber"),
              description: "5g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("calories"),
              description: "350 kcal",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("vitamins"),
              description: " Vitamin A (10,000 IU),Vitamin C (30mg)",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("minerals"),
              description: "Calcium (1.2%), Phosphorus (1%)",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("omega_three"),
              description: "0.5g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("omega_six"),
              description: "2.5g",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("guidelines"),
              description: "lorem ipusm",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("small_breed"),
              description: "1/2 to 1 cup per day",
              allPadding: false,
            ),
            InfoLabel(
              title: t.translate("special_feature"),
              description: "Contains DHA for brain development",
              allPadding: false,
            ),
          ],
        ),
      ),
    );
  }
}
