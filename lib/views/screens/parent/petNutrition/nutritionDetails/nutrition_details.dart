import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/nutrition_info.dart';
import 'widgets/nutrition_price.dart';

class NutritionDetails extends StatefulWidget {
  const NutritionDetails({super.key});

  @override
  State<NutritionDetails> createState() => _NutritionDetailsState();
}

class _NutritionDetailsState extends State<NutritionDetails> {
  late NutritionData info;
  late int index;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      index = argumentData[0]['index'];
      info = argumentData[1]['info'];
      setState(() {
        info;
        index;
      });
    }
    super.initState();
  }

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
                      subTitle: info.nutIngredients ?? "",
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
                          description: info.nutProtein ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("fat"),
                          description: info.nutFat ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("carbohydrates"),
                          description: info.nutCarbohydrate ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("fiber"),
                          description: info.nutFiber ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("calories"),
                          description: info.nutCalories ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("vitamins"),
                          description: info.nutVitamins ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("minerals"),
                          description: info.nutMinerals ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("omega_three"),
                          description: info.nutOmega3Fatty ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("omega_six"),
                          description: info.nutOmega6Fatty ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("guidelines"),
                          description: info.nutFeedingGuidelines ?? "",
                        ),
                        MedicalInfo(
                          title: t.translate("special_feature"),
                          description: info.nutSpecialFeatures ?? "",
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
