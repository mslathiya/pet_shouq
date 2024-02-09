import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddNutrition extends StatefulWidget {
  const AddNutrition({super.key});

  @override
  State<AddNutrition> createState() => _AddNutritionState();
}

class _AddNutritionState extends State<AddNutrition> {
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
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return Scaffold(
      appBar: HeaderWithBack(
        title: Get.arguments != null && Get.arguments[0]['mode'] == "Edit"
            ? "edit_screen_nutrition_feeding".tr
            : "screen_nutrition_feeding".tr,
        onPressBack: () => Get.back(),
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
                                headerLabel: "lbl_food_name".tr,
                              ),
                              inputHint: "hint_food_name".tr,
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
                                headerLabel: "lbl_brand".tr,
                                compulsory: true,
                              ),
                              inputHint: "hint_brand".tr,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText:
                                        "dynamic_field_required".trParams(
                                      {"field": "lbl_brand".tr},
                                    ),
                                  ),
                                ],
                              ).call,
                              editingController: controller.nutBrand,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SelectorField(
                              headerWidget: InputHeader(
                                headerLabel: "lbl_food_type".tr,
                                compulsory: true,
                              ),
                              inputHint:
                                  controller.nutFoodType ?? "hint_food_type".tr,
                              suffixIcon: SizedBox(
                                width: 26.w,
                                height: 26.h,
                                child: Icon(
                                  Entypo.chevron_down,
                                  size: 26.sp,
                                  color: AppColors.hintColor,
                                ),
                              ),
                              onSelectItem: () {
                                FocusManager.instance.primaryFocus!.unfocus();
                                controller.onSelectNutritionType();
                              },
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
                                      headerLabel: "lbl_life_stage".tr,
                                      compulsory: true,
                                    ),
                                    inputHint: "hint_life_stage".tr,
                                    editingController: controller.nutLifeStage,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "dynamic_field_required".trParams(
                                            {"field": "lbl_life_stage".tr},
                                          ),
                                        ),
                                      ],
                                    ).call,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: "lbl_species".tr,
                                      compulsory: true,
                                    ),
                                    inputHint: "hint_species".tr,
                                    editingController: controller.nutSpecies,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "dynamic_field_required".trParams(
                                            {"field": "lbl_species".tr},
                                          ),
                                        ),
                                      ],
                                    ).call,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              maxLength: 200,
                              headerWidget: InputHeader(
                                headerLabel: "ingredients".tr,
                              ),
                              inputHint: "hint_ingredients".tr,
                              editingController: controller.nutIngredients,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: "lbl_nutrition_content".tr,
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
                                      headerLabel: "protein".tr,
                                    ),
                                    inputHint: "hint_protein".tr,
                                    editingController: controller.nutProtein,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: "fat".tr,
                                    ),
                                    inputHint: "hint_fat".tr,
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
                                      headerLabel: "carbohydrates".tr,
                                    ),
                                    inputHint: "hint_carbohydrates".tr,
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
                                      headerLabel: "fiber".tr,
                                    ),
                                    inputHint: "hint_fiber".tr,
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
                                      headerLabel: "calories".tr,
                                    ),
                                    inputHint: "hint_calories".tr,
                                    editingController: controller.nutCalories,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: "vitamins".tr,
                                    ),
                                    inputHint: "hint_vitamins".tr,
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
                                      headerLabel: "minerals".tr,
                                    ),
                                    inputHint: "hint_mineral".tr,
                                    editingController: controller.nutMinerals,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      headerLabel: "omega_three".tr,
                                    ),
                                    inputHint: "hint_omega_three".tr,
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
                                headerLabel: "omega_six".tr,
                              ),
                              inputHint: "hint_omega_six".tr,
                              editingController: controller.nutOmegaSixFatty,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: "guidelines".tr,
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
                              maxLength: 200,
                              headerWidget: InputHeader(
                                headerLabel: "lbl_guideline".tr,
                              ),
                              inputHint: "hint_guideline".tr,
                              editingController:
                                  controller.nutFeedingGuidelines,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              maxLength: 200,
                              headerWidget: InputHeader(
                                headerLabel: "special_feature".tr,
                              ),
                              inputHint: "hint_feature".tr,
                              editingController: controller.nutSpecialFeatures,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              maxLength: 9,
                              headerWidget: InputHeader(
                                headerLabel: "lbl_price".tr,
                                compulsory: true,
                              ),
                              inputHint: "hint_price".tr,
                              editingController: controller.nutPrice,
                              keyboardType: TextInputType.number,
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                    errorText:
                                        "dynamic_field_required".trParams(
                                      {"field": "lbl_price".tr},
                                    ),
                                  ),
                                ],
                              ).call,
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    controller.saveNutritionInfo();
                                  }
                                },
                                buttonTitle: "btn_submit".tr,
                                width: width - 20,
                                buttonStyle: TextStyle(
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                            !isNeedSafeArea
                                ? SizedBox(
                                    height: 15.h,
                                  )
                                : const SizedBox(),
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
