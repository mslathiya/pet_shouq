import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'expandable_box.dart';

class NutritionFeedingDetail extends StatelessWidget {
  const NutritionFeedingDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return ExpandableBox(
      title: t.translate("nutrition_feeding_details"),
      infoList: const [],
      customWidget: Column(
        children: [
          InfoLabel(
            title: t.translate("lbl_food_name"),
            description: "Premium Puppy Chow",
          ),
          InfoLabel(
            title: t.translate("lbl_brand"),
            description: "ABC Pet Foods",
          ),
          InfoLabel(
            title: t.translate("food_type"),
            description: "Dry Kibble",
          ),
          InfoLabel(
            title: t.translate("lbl_life_stage"),
            description: "Puppy",
          ),
          InfoLabel(
            title: t.translate("lbl_species"),
            description: "Dog",
          ),
          InfoLabel(
            title: t.translate("ingredients"),
            description:
                "Chicken meal, brown rice, peas, barley, chicken fat, etc.",
          ),
          InfoLabel(
            title: t.translate("nutrition_content"),
            description: "50g",
          ),
          InfoLabel(
            title: t.translate("protein"),
            description: "28g",
          ),
          InfoLabel(
            title: t.translate("fat"),
            description: "12g",
          ),
          InfoLabel(
            title: t.translate("carbohydrates"),
            description: "48g",
          ),
          InfoLabel(
            title: t.translate("fiber"),
            description: "5g",
          ),
          InfoLabel(
            title: t.translate("calories"),
            description: "350 kcal",
          ),
          InfoLabel(
            title: t.translate("vitamins"),
            description: "Vitamin A (10,000 IU), Vitamin C (30mg)",
          ),
          InfoLabel(
            title: t.translate("minerals"),
            description: "Calcium (1.2%),Phosphorus (1%)",
          ),
          InfoLabel(
            title: t.translate("omega_three"),
            description: "0.5g",
          ),
          InfoLabel(
            title: t.translate("omega_six"),
            description: "2.5g",
          ),
          InfoLabel(
            title: t.translate("guidelines"),
            description: "Lorem ipsum",
          ),
          InfoLabel(
            title: t.translate("small_breed"),
            description: "1/2 to 1 cup per day",
          ),
          InfoLabel(
            title: t.translate("large_breed"),
            description: "2 to 3 cups per day",
          ),
          InfoLabel(
            title: t.translate("special_feature"),
            description: "Contains DHA for brain development",
          ),
          InfoLabel(
            title: t.translate("special_feature"),
            description: "Contains DHA for brain development",
            customRight: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$1.50",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.gray,
                        ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 4.w),
                  ),
                  TextSpan(
                    text: t.translate("per_pound"),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.gray,
                          fontSize: 13.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
