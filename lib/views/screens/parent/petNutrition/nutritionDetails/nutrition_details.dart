import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_nutrition_details".tr,
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
                    NutritionInfo(
                      info: info,
                    ),
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
                        MedicalInfo(
                          title: "nutrition_content".tr,
                          description: "20g",
                        ),
                        MedicalInfo(
                          title: "protein".tr,
                          description: info.nutProtein ?? "",
                        ),
                        MedicalInfo(
                          title: "fat".tr,
                          description: info.nutFat ?? "",
                        ),
                        MedicalInfo(
                          title: "carbohydrates".tr,
                          description: info.nutCarbohydrate ?? "",
                        ),
                        MedicalInfo(
                          title: "fiber".tr,
                          description: info.nutFiber ?? "",
                        ),
                        MedicalInfo(
                          title: "calories".tr,
                          description: info.nutCalories ?? "",
                        ),
                        MedicalInfo(
                          title: "vitamins".tr,
                          description: info.nutVitamins ?? "",
                        ),
                        MedicalInfo(
                          title: "minerals".tr,
                          description: info.nutMinerals ?? "",
                        ),
                        MedicalInfo(
                          title: "omega_three".tr,
                          description: info.nutOmega3Fatty ?? "",
                        ),
                        MedicalInfo(
                          title: "omega_six".tr,
                          description: info.nutOmega6Fatty ?? "",
                        ),
                        MedicalInfo(
                          title: "guidelines".tr,
                          description: info.nutFeedingGuidelines ?? "",
                        ),
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
              onPress: () => Get.offNamed(petAddNutrition, arguments: [
                {
                  "mode": "Edit",
                },
                {"info": info}
              ]),
            )
          ],
        ),
      ),
    );
  }
}
