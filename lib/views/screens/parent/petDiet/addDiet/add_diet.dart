import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddDiet extends StatefulWidget {
  const AddDiet({super.key});

  @override
  State<AddDiet> createState() => _AddDietState();
}

class _AddDietState extends State<AddDiet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DietLogController>().editDietLog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: Get.arguments != null && Get.arguments[0]['mode'] == "Edit"
            ? "screen_update_diet_log".tr
            : "screen_add_diet_log".tr,
        onPressBack: () => Get.back(),
      ),
      body: LayoutBuilder(
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
                  child: GetBuilder<DietLogController>(
                    builder: (controller) => Form(
                      key: controller.dietAddEditKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputField(
                            headerWidget: InputHeader(
                              compulsory: true,
                              headerLabel: "lbl_food_type".tr,
                            ),
                            inputHint: "hint_food_type".tr,
                            validator: MultiValidator(
                              [
                                RequiredValidator(
                                  errorText: "dynamic_field_required".trParams(
                                    {"field": "lbl_food_type".tr},
                                  ),
                                ),
                              ],
                            ).call,
                            inputError: controller.foodNameError,
                            editingController: controller.foodName,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SelectorField(
                            headerWidget: InputHeader(
                              compulsory: true,
                              headerLabel: "date".tr,
                            ),
                            inputHint: controller.date ?? "hint_select_date".tr,
                            suffixIcon: SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: SvgPicture.asset(
                                AppAssets.icCalendar,
                                height: 18.sp,
                                width: 18.sp,
                                colorFilter: ColorFilter.mode(
                                  AppColors.hintColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            onSelectItem: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.openDatePicker();
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SelectorField(
                            headerWidget: InputHeader(
                              compulsory: true,
                              headerLabel: "lbl_meal_time".tr,
                            ),
                            inputHint: controller.time ?? "hint_meal_time".tr,
                            suffixIcon: SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Icon(
                                FontAwesome5Solid.clock,
                                color: AppColors.hintColor,
                                size: 20.sp,
                              ),
                            ),
                            onSelectItem: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.openTimePicker();
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            headerWidget: InputHeader(
                              headerLabel: "lbl_portion_size".tr,
                            ),
                            inputHint: "hint_portion_size".tr,
                            editingController: controller.portionSize,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InputField(
                            headerWidget: InputHeader(
                              headerLabel: "lbl_special_instruction".tr,
                            ),
                            inputHint: "hint_special_instruction".tr,
                            editingController: controller.specialInstructions,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SelectorField(
                                  headerWidget: InputHeader(
                                    compulsory: true,
                                    headerLabel: "lbl_water".tr,
                                  ),
                                  inputHint: controller.water ?? "lbl_water".tr,
                                  suffixIcon: Icon(
                                    Entypo.chevron_down,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                  onSelectItem: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    controller.selectWithWater();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: InputField(
                                  headerWidget: InputHeader(
                                    headerLabel: "lbl_weight_value".tr,
                                  ),
                                  inputHint: "hint_weight".tr,
                                  editingController: controller.weight,
                                  keyboardType: TextInputType.number,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              isLoading: controller.isLoading,
                              onTap: () {
                                if (controller.dietAddEditKey.currentState!
                                    .validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  controller.saveDietInfo();
                                }
                              },
                              buttonTitle: "btn_save".tr,
                              width: width - 20,
                              buttonStyle: TextStyle(
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
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
    );
  }
}
