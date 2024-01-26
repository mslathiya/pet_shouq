import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class AddNewPet extends StatelessWidget {
  const AddNewPet({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "btn_add_pet".tr,
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
                  child: GetBuilder<PetController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImagePicker(
                                imagePath: controller.imagePath,
                                onPickImage: (CroppedFile file, String type) {
                                  controller.onPickImage(file);
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  compulsory: true,
                                  headerLabel: "lbl_pet_name".tr,
                                ),
                                inputHint: "hint_pet_name".tr,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "dynamic_field_required".trParams(
                                        {"field": "lbl_pet_name".tr},
                                      ),
                                    ),
                                  ],
                                ).call,
                                inputError: controller.petNameError,
                                editingController: controller.petName,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SelectorField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_breed".tr,
                                ),
                                inputHint: controller.breed ?? "hint_breed".tr,
                                suffixIcon: SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: Icon(
                                    Entypo.chevron_down,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                                onSelectItem: () =>
                                    controller.openBreedPicker(),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_marking".tr,
                                ),
                                inputHint: "hint_marking".tr,
                                editingController: controller.marking,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SelectorField(
                                headerWidget: InputHeader(
                                  compulsory: true,
                                  headerLabel: "lbl_birth_date".tr,
                                ),
                                inputHint: controller.birthDate ??
                                    "hint_birth_date".tr,
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
                                onSelectItem: () => controller.openDatePicker(),
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
                                        headerLabel: "lbl_weight".tr,
                                      ),
                                      inputHint: "hint_weight".tr,
                                      editingController: controller.weight,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: InputField(
                                      headerWidget: InputHeader(
                                        headerLabel: "lbl_height".tr,
                                      ),
                                      inputHint: "hint_height".tr,
                                      editingController: controller.height,
                                      keyboardType: TextInputType.number,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_chip_no".tr,
                                ),
                                inputHint: "hint_chip_no".tr,
                                editingController: controller.chipNumber,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SelectorField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_spayed".tr,
                                ),
                                inputHint:
                                    controller.isSpayed ?? "hint_spayed".tr,
                                suffixIcon: SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: Icon(
                                    Entypo.chevron_down,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                                onSelectItem: () =>
                                    controller.openSpayedPicker(),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_pedigree_front".tr,
                                ),
                                inputHint: "hint_pedigree_front".tr,
                                editingController: controller.pedigreeFront,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_pedigree_back".tr,
                                ),
                                inputHint: "hint_pedigree_back".tr,
                                editingController: controller.pedigreeBack,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_allergies".tr,
                                ),
                                inputHint: "hint_allergies".tr,
                                editingController: controller.allergy,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    value: controller.differentAddress,
                                    onChanged: (value) =>
                                        controller.haveDifferentAddress(),
                                    activeColor: AppColors.secondary,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "pet_taker_address".tr,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            height: 1.2,
                                            letterSpacing: 0.20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  )
                                ],
                              ),
                              controller.differentAddress
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        InputField(
                                          isMultiline: true,
                                          headerWidget: InputHeader(
                                            headerLabel: "lbl_address".tr,
                                          ),
                                          inputHint: "hint_address".tr,
                                          editingController:
                                              controller.petCareAddress,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                isMultiline: true,
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_description".tr,
                                ),
                                inputHint: "hint_description".tr,
                                editingController: controller.description,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_qr_code".tr,
                                ),
                                inputHint: "hint_qr_code".tr,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 24.w,
                                    height: 24.h,
                                    child: SvgPicture.asset(
                                      AppAssets.icQrCode,
                                      height: 18.sp,
                                      width: 18.sp,
                                    ),
                                  ),
                                ),
                                editingController: controller.qrCode,
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
                                      controller.savePetData();
                                    }
                                  },
                                  buttonTitle: "btn_submit".tr,
                                  width: width - 20,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
