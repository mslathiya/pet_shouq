import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/nutrition_info.dart';
import 'widgets/nutrition_price.dart';

class NutritionDetails extends StatelessWidget {
  const NutritionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_nutrition_details"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const NutritionInfo(),
                    SingleLabelItem(
                      title: t.translate("ingredients"),
                      asset: AppAssets.icRecipe,
                      subTitle:
                          'Chicken meal, brown rice, peas, barley, chicken fat, etc.',
                    ),
                    ExpandableBox(
                      initiallyExpanded: true,
                      infoList: [
                        MedicalInfo(
                          title: t.translate("nutrition_content"),
                          description: "20g",
                        ),
                        MedicalInfo(
                          title: t.translate("protein"),
                          description: "28g",
                        ),
                        MedicalInfo(
                          title: t.translate("fat"),
                          description: "12g",
                        ),
                        MedicalInfo(
                          title: t.translate("carbohydrates"),
                          description: "48g",
                        ),
                        MedicalInfo(
                          title: t.translate("fiber"),
                          description: "5g",
                        ),
                        MedicalInfo(
                          title: t.translate("calories"),
                          description: "350 kcal",
                        ),
                        MedicalInfo(
                          title: t.translate("vitamins"),
                          description:
                              " Vitamin A (10,000 IU),Vitamin C (30mg)",
                        ),
                        MedicalInfo(
                          title: t.translate("minerals"),
                          description: "Calcium (1.2%), Phosphorus (1%)",
                        ),
                        MedicalInfo(
                          title: t.translate("omega_three"),
                          description: "0.5g",
                        ),
                        MedicalInfo(
                          title: t.translate("omega_six"),
                          description: "2.5g",
                        ),
                        MedicalInfo(
                          title: t.translate("guidelines"),
                          description: "lorem ipusm",
                        ),
                        MedicalInfo(
                          title: t.translate("small_breed"),
                          description: "1/2 to 1 cup per day",
                        ),
                        MedicalInfo(
                          title: t.translate("special_feature"),
                          description: "Contains DHA for brain development",
                        ),
                      ],
                      title: t.translate("other_nutrition_detail"),
                    ),
                  ],
                ),
              ),
            ),
            NutritionPrice(
              t: t,
              onPress: () => Navigator.pushNamed(
                context,
                petAddNutrition,
              ),
            )
          ],
        ),
      ),
    );
  }
}
