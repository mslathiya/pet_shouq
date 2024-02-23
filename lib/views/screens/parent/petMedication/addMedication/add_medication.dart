import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddMedication extends StatefulWidget {
  const AddMedication({super.key});

  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  @override
  void initState() {
    Get.find<MedicationController>().getMedicationTypeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;

    return Scaffold(
      appBar: HeaderWithBack(
        title: Get.arguments != null && Get.arguments[0]['mode'] == "Edit"
            ? "screen_update_medication".tr
            : "screen_add_medication".tr,
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
                    child: GetBuilder<MedicationController>(
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
                                  headerLabel: "lbl_medication_name".tr,
                                ),
                                inputHint: "hint_medication_name".tr,
                                editingController: controller.mediName,
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
                                inputError: controller.mediNameError,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SelectorField(
                                errorText: controller.mediTypeError,
                                headerWidget: InputHeader(
                                  compulsory: true,
                                  headerLabel: "lbl_medication_type".tr,
                                ),
                                inputHint: controller.mediType?.title ??
                                    "hint_medication_type".tr,
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
                                  controller.selectMedicationType();
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_veterinarian".tr,
                                  compulsory: true,
                                ),
                                inputHint: "hint_veterinarian".tr,
                                editingController:
                                    controller.mediPreVeterinarian,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "dynamic_field_required".trParams(
                                        {"field": "lbl_veterinarian".tr},
                                      ),
                                    ),
                                  ],
                                ).call,
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
                                        headerLabel: "lbl_species".tr,
                                        compulsory: true,
                                      ),
                                      inputHint: "hint_species".tr,
                                      editingController:
                                          controller.mediPetSpecies,
                                      validator: MultiValidator(
                                        [
                                          RequiredValidator(
                                            errorText: "dynamic_field_required"
                                                .trParams(
                                              {"field": "lbl_species".tr},
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
                                        headerLabel: "lbl_dosage".tr,
                                      ),
                                      inputHint: "hint_dosage".tr,
                                      editingController: controller.mediDosage,
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
                                        headerLabel: "lbl_frequency".tr,
                                      ),
                                      inputHint: "hint_frequency".tr,
                                      editingController:
                                          controller.mediFrequency,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: InputField(
                                      headerWidget: InputHeader(
                                        headerLabel: "lbl_duration".tr,
                                      ),
                                      inputHint: "hint_duration".tr,
                                      editingController:
                                          controller.mediDuration,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "prescription_reason".tr,
                                ),
                                inputHint: "hint_prescription_reason".tr,
                                editingController:
                                    controller.mediReasonPrescription,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "administrative_info".tr,
                                ),
                                inputHint: "hint_administrative_info".tr,
                                editingController:
                                    controller.mediAdminInstruction,
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
                                      inputHint: controller.mediStartDate ??
                                          "hint_select_date".tr,
                                      headerWidget: InputHeader(
                                        compulsory: true,
                                        headerLabel: "lbl_start_date".tr,
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
                                      inputHint: controller.mediEndDate ??
                                          "hint_select_date".tr,
                                      headerWidget: InputHeader(
                                        compulsory: true,
                                        headerLabel: "lbl_end_date".tr,
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
                                  headerLabel: "lbl_refills".tr,
                                ),
                                inputHint: "hint_refills".tr,
                                editingController: controller.mediRefills,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                maxLength: 1000,
                                isMultiline: true,
                                headerWidget: InputHeader(
                                  headerLabel: "special_notes".tr,
                                ),
                                inputHint: "hint_special_note".tr,
                                editingController: controller.mediSpecialNotes,
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
                                      controller.saveMedicationInfo();
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
