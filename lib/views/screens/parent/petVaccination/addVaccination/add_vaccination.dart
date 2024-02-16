import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddVaccination extends StatefulWidget {
  const AddVaccination({super.key});

  @override
  State<AddVaccination> createState() => _AddVaccinationState();
}

class _AddVaccinationState extends State<AddVaccination> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;

    return Scaffold(
      appBar: HeaderWithBack(
        title: Get.arguments != null && Get.arguments[0]['mode'] == "Edit"
            ? "screen_update_vaccination".tr
            : "screen_add_vaccination".tr,
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
                    child: GetBuilder<VaccinationController>(
                      builder: (controller) {
                        return Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InputField(
                                headerWidget: InputHeader(
                                  compulsory: true,
                                  headerLabel: "vaccination_name".tr,
                                ),
                                inputHint: "hint_vaccination_name".tr,
                                editingController: controller.vacName,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "dynamic_field_required".trParams(
                                        {"field": "lbl_medication_name".tr},
                                      ),
                                    ),
                                  ],
                                ).call,
                                inputError: controller.vacNameError,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SelectorField(
                                headerWidget: InputHeader(
                                  compulsory: true,
                                  headerLabel: "vaccination_type".tr,
                                ),
                                inputHint: controller.vacType ??
                                    "hint_vaccination_type".tr,
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
                                  controller.onSelectVaccinationType();
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_species".tr,
                                ),
                                inputHint: "hint_species".tr,
                                editingController: controller.vacPetSpecies,
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
                                      inputHint: controller.vacDate ??
                                          "vaccination_date".tr,
                                      headerWidget: InputHeader(
                                        compulsory: true,
                                        headerLabel: "hint_select_date".tr,
                                      ),
                                      suffixIcon: SizedBox(
                                        width: 24.w,
                                        height: 24.h,
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
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        controller.openDatePicker(1);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: SelectorField(
                                      inputHint: controller.vacDueDate ??
                                          "next_due_date".tr,
                                      headerWidget: InputHeader(
                                        compulsory: true,
                                        headerLabel: "hint_select_date".tr,
                                      ),
                                      suffixIcon: SizedBox(
                                        width: 24.w,
                                        height: 24.h,
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
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        controller.openDatePicker(2);
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "vaccination_provider".tr,
                                ),
                                inputHint: "hint_vaccination_provider".tr,
                                editingController: controller.vacProvider,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "vaccination_lot_no".tr,
                                ),
                                inputHint: "hint_vaccination_lot_no".tr,
                                editingController: controller.vacLotNo,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "vaccination_id".tr,
                                ),
                                inputHint: "hint_vaccination_id".tr,
                                editingController: controller.vacCertificateId,
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
                                      controller.saveVaccinationInfo();
                                    }
                                  },
                                  buttonTitle: "btn_save".tr,
                                  width: width - 20,
                                  buttonStyle: TextStyle(
                                    fontSize: 9.sp,
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
                        );
                      },
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
