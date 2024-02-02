import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class EditParentProfile extends StatefulWidget {
  const EditParentProfile({super.key});

  @override
  State<EditParentProfile> createState() => _EditParentProfileState();
}

class _EditParentProfileState extends State<EditParentProfile> {
  @override
  void initState() {
    Get.find<EditParentProfileController>().updateInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_edit_profile".tr,
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
                  child: GetBuilder<EditParentProfileController>(
                    builder: (controller) {
                      return Form(
                        key: controller.editParentProfileFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              InputHeader(
                                compulsory: true,
                                headerLabel: "lbl_parent_name".tr,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InputField(
                                      inputHint: "hint_first_name".tr,
                                      editingController: controller.firstName,
                                      validator: MultiValidator(
                                        [
                                          RequiredValidator(
                                            errorText: "dynamic_field_required"
                                                .trParams(
                                              {"field": "lbl_first_name".tr},
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
                                      inputHint: "hint_last_name".tr,
                                      editingController: controller.lastName,
                                      validator: MultiValidator(
                                        [
                                          RequiredValidator(
                                            errorText: "dynamic_field_required"
                                                .trParams(
                                              {"field": "lbl_last_name".tr},
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
                              PhoneInput(
                                isCompulsory: true,
                                headerLabel: "lbl_parent_phone".tr,
                                countryDialCode: controller.pickedCode ??
                                    Get.locale?.countryCode,
                                editingController: controller.phoneNumber,
                                onCountryChanged: (countryCode) =>
                                    controller.onChangeCountry(countryCode, 1),
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "dynamic_field_required".trParams(
                                        {"field": "lbl_parent_phone".tr},
                                      ),
                                    ),
                                  ],
                                ).call,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SelectorField(
                                headerWidget: InputHeader(
                                  headerLabel: "lbl_gender".tr,
                                ),
                                inputHint: controller.gender != ''
                                    ? controller.gender
                                    : "hint_gender".tr,
                                suffixIcon: Icon(
                                  Entypo.chevron_down,
                                  size: 26.sp,
                                  color: AppColors.hintColor,
                                ),
                                onSelectItem: () =>
                                    controller.openGenderPicker(),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: SelectorField(
                                      headerWidget: InputHeader(
                                        headerLabel: "lbl_birth_date".tr,
                                      ),
                                      inputHint: controller.birthDate != ''
                                          ? controller.birthDate
                                          : "hint_birth_date".tr,
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
                                      onSelectItem: () =>
                                          controller.openDatePicker(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SelectorField(
                                      headerWidget: InputHeader(
                                        headerLabel: "lbl_age".tr,
                                      ),
                                      inputHint: controller.age != ''
                                          ? "${controller.age} ${"years".tr}"
                                          : "lbl_age".tr,
                                      onSelectItem: () {},
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  compulsory: true,
                                  headerLabel: "lbl_email".tr,
                                ),
                                inputHint: "hint_email".tr,
                                editingController: controller.email,
                                enableInput: false,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "home_address".tr,
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                inputHint: "hint_street_address".tr,
                                editingController: controller.addressOne,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                inputHint: "hint_street_address_two".tr,
                                editingController: controller.addressTwo,
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
                                        compulsory: false,
                                        headerLabel: "lbl_city".tr,
                                      ),
                                      inputHint: "hint_city".tr,
                                      editingController: controller.city,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: InputField(
                                      headerWidget: InputHeader(
                                        compulsory: false,
                                        headerLabel: "lbl_province".tr,
                                      ),
                                      inputHint: "hint_province".tr,
                                      editingController: controller.province,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              PhoneInput(
                                headerLabel: "lbl_secondary_phone".tr,
                                countryDialCode:
                                    controller.pickedCodeSecondary ??
                                        Get.locale?.countryCode,
                                editingController: controller.alternatePhone,
                                onCountryChanged: (countryCode) =>
                                    controller.onChangeCountry(countryCode, 2),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_display_name".tr,
                                ),
                                inputHint: "hint_display_name".tr,
                                editingController: controller.displayName,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InputField(
                                maxLength: 1000,
                                isMultiline: true,
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: "lbl_mailing_address".tr,
                                ),
                                inputHint: "hint_mailing_address".tr,
                                editingController: controller.mailingAddress,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ButtonView(
                                  isLoading: controller.isLoading,
                                  onTap: () {
                                    if (controller
                                        .editParentProfileFormKey.currentState!
                                        .validate()) {
                                      controller.updateParentProfile();
                                    }
                                  },
                                  buttonTitle: "btn_save".tr,
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
