import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/controllers.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddNutrition extends StatefulWidget {
  const AddNutrition({super.key});

  @override
  State<AddNutrition> createState() => _AddNutritionState();
}

class _AddNutritionState extends State<AddNutrition> {
  int selectedOption = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<NutritionController>().editNutritionInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_nutrition_feeding"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: GetBuilder<NutritionController>(
                      builder: (controller) => Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_food_name"),
                              ),
                              inputHint: t.translate("hint_food_name"),
                              editingController: controller.nutFoodName,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText:
                                        "dynamic_field_required".trParams(
                                      {"field": "lbl_food_name".tr},
                                    ),
                                  ),
                                ],
                              ).call,
                              inputError: controller.foodNameError,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("lbl_brand"),
                              ),
                              inputHint: t.translate("hint_brand"),
                              editingController: controller.nutBrand,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SelectorField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("lbl_food_type"),
                              ),
                              inputHint: controller.nutFoodType ??
                                  t.translate("hint_food_type"),
                              suffixIcon: SizedBox(
                                width: 26.w,
                                height: 26.h,
                                child: Icon(
                                  Entypo.chevron_down,
                                  size: 26.sp,
                                  color: AppColors.hintColor,
                                ),
                              ),
                              onSelectItem: () =>
                                  controller.onSelectNutritionType(),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel:
                                          t.translate("lbl_life_stage"),
                                    ),
                                    inputHint: t.translate("hint_life_stage"),
                                    editingController: controller.nutLifeStage,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("lbl_species"),
                                    ),
                                    inputHint: t.translate("hint_species"),
                                    editingController: controller.nutSpecies,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("ingredients"),
                              ),
                              inputHint: t.translate("hint_ingredients"),
                              editingController: controller.nutIngredients,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: t.translate("lbl_nutrition_content"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontSize: 14.sp),
                                children: [
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 2.w,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ":",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("protein"),
                                    ),
                                    inputHint: t.translate("hint_protein"),
                                    editingController: controller.nutProtein,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("fat"),
                                    ),
                                    inputHint: t.translate("hint_fat"),
                                    editingController: controller.nutFat,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("carbohydrates"),
                                    ),
                                    inputHint:
                                        t.translate("hint_carbohydrates"),
                                    editingController:
                                        controller.nutCarbohydrate,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("fiber"),
                                    ),
                                    inputHint: t.translate("hint_fiber"),
                                    editingController: controller.nutFiber,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("calories"),
                                    ),
                                    inputHint: t.translate("hint_calories"),
                                    editingController: controller.nutCalories,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("vitamins"),
                                    ),
                                    inputHint: t.translate("hint_vitamins"),
                                    editingController: controller.nutVitamins,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("minerals"),
                                    ),
                                    inputHint: t.translate("hint_mineral"),
                                    editingController: controller.nutMinerals,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: t.translate("omega_three"),
                                    ),
                                    inputHint: t.translate("hint_omega_three"),
                                    editingController:
                                        controller.nutOmegaThreeFatty,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("omega_six"),
                              ),
                              inputHint: t.translate("hint_omega_six"),
                              editingController: controller.nutOmegaSixFatty,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: t.translate("guidelines"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontSize: 14.sp),
                                children: [
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 2.w,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ":",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("lbl_guideline"),
                              ),
                              inputHint: t.translate("hint_guideline"),
                              editingController:
                                  controller.nutFeedingGuidelines,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("special_feature"),
                              ),
                              inputHint: t.translate("hint_feature"),
                              editingController: controller.nutSpecialFeatures,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                headerLabel: t.translate("lbl_price"),
                              ),
                              inputHint: t.translate("hint_price"),
                              editingController: controller.nutPrice,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ButtonView(
                                isLoading: controller.isLoading,
                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.saveNutritionInfo();
                                  }
                                },
                                buttonTitle: t.translate("btn_submit"),
                                width: width - 20,
                                buttonStyle: TextStyle(
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
