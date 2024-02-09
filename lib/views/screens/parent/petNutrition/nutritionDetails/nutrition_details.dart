import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/models.dart';
import '../../../../../helper/helpers.dart';
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
    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_nutrition_details".tr,
        onPressBack: () => Get.back(),
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
                    NutritionInfo(
                      info: info,
                    ),
                    if (CommonHelper.isNotEmpty(info.nutIngredients))
                      SingleLabelItem(
                        margins: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          bottom: 10.h,
                        ),
                        title: "ingredients".tr,
                        asset: AppAssets.icRecipe,
                        subTitle: info.nutIngredients ?? "",
                      ),
                    ExpandableBox(
                      initiallyExpanded: true,
                      infoList: [
                        if (CommonHelper.isNotEmpty(info.nutNutritionalContent))
                          MedicalInfo(
                            title: "nutrition_content".tr,
                            description: info.nutNutritionalContent ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutProtein))
                          MedicalInfo(
                            title: "protein".tr,
                            description: info.nutProtein ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutFat))
                          MedicalInfo(
                            title: "fat".tr,
                            description: info.nutFat ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutCarbohydrate))
                          MedicalInfo(
                            title: "carbohydrates".tr,
                            description: info.nutCarbohydrate ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutFiber))
                          MedicalInfo(
                            title: "fiber".tr,
                            description: info.nutFiber ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutCalories))
                          MedicalInfo(
                            title: "calories".tr,
                            description: info.nutCalories ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutVitamins))
                          MedicalInfo(
                            title: "vitamins".tr,
                            description: info.nutVitamins ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutMinerals))
                          MedicalInfo(
                            title: "minerals".tr,
                            description: info.nutMinerals ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutOmega3Fatty))
                          MedicalInfo(
                            title: "omega_three".tr,
                            description: info.nutOmega3Fatty ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutOmega6Fatty))
                          MedicalInfo(
                            title: "omega_six".tr,
                            description: info.nutOmega6Fatty ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutFeedingGuidelines))
                          MedicalInfo(
                            title: "guidelines".tr,
                            description: info.nutFeedingGuidelines ?? "",
                          ),
                        if (CommonHelper.isNotEmpty(info.nutSpecialFeatures))
                          MedicalInfo(
                            title: "special_feature".tr,
                            description: info.nutSpecialFeatures ?? "",
                          ),
                      ],
                      title: "other_nutrition_detail".tr,
                    ),
                  ],
                ),
              ),
            ),
            NutritionPrice(
              info: info,
              onPress: () => Get.offNamed(
                petAddNutrition,
                arguments: [
                  {
                    "mode": "Edit",
                  },
                  {"info": info}
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
