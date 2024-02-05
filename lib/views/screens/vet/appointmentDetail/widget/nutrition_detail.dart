import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class NutritionFeedingDetail extends StatelessWidget {
  const NutritionFeedingDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableBox(
      title: "nutrition_feeding_details".tr,
      infoList: const [],
      customWidget: Column(
        children: [
          InfoLabel(
            title: "lbl_food_name".tr,
            description: "Premium Puppy Chow",
          ),
          InfoLabel(
            title: "lbl_brand".tr,
            description: "ABC Pet Foods",
          ),
          InfoLabel(
            title: "food_type".tr,
            description: "Dry Kibble",
          ),
          InfoLabel(
            title: "lbl_life_stage".tr,
            description: "Puppy",
          ),
          InfoLabel(
            title: "lbl_species".tr,
            description: "Dog",
          ),
          InfoLabel(
            title: "ingredients".tr,
            description:
                "Chicken meal, brown rice, peas, barley, chicken fat, etc.",
          ),
          InfoLabel(
            title: "nutrition_content".tr,
            description: "50g",
          ),
          InfoLabel(
            title: "protein".tr,
            description: "28g",
          ),
          InfoLabel(
            title: "fat".tr,
            description: "12g",
          ),
          InfoLabel(
            title: "carbohydrates".tr,
            description: "48g",
          ),
          InfoLabel(
            title: "fiber".tr,
            description: "5g",
          ),
          InfoLabel(
            title: "calories".tr,
            description: "350 kcal",
          ),
          InfoLabel(
            title: "vitamins".tr,
            description: "Vitamin A (10,000 IU), Vitamin C (30mg)",
          ),
          InfoLabel(
            title: "minerals".tr,
            description: "Calcium (1.2%),Phosphorus (1%)",
          ),
          InfoLabel(
            title: "omega_three".tr,
            description: "0.5g",
          ),
          InfoLabel(
            title: "omega_six".tr,
            description: "2.5g",
          ),
          InfoLabel(
            title: "guidelines".tr,
            description: "Lorem ipsum",
          ),
          InfoLabel(
            title: "small_breed".tr,
            description: "1/2 to 1 cup per day",
          ),
          InfoLabel(
            title: "large_breed".tr,
            description: "2 to 3 cups per day",
          ),
          InfoLabel(
            title: "special_feature".tr,
            description: "Contains DHA for brain development",
          ),
          InfoLabel(
            title: "special_feature".tr,
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
                    text: "per_pound".tr,
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
