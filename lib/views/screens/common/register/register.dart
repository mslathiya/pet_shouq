import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../config/config.dart';
import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widget/radio_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: GetBuilder<RegisterController>(
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const HeaderBar(),
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeaderLabel(
                                  header: t.translate("create_account"),
                                  subHeader:
                                      t.translate('create_account_message'),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                RadioWidget(
                                  selectedOption: controller.accountType,
                                  onSelectOption: ((index) =>
                                      controller.onToggleType(index)),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
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
                                  headerLabel: controller.accountType == 1
                                      ? t.translate("lbl_parent_name")
                                      : t.translate("lbl_veterinarian_name"),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InputField(
                                        inputHint:
                                            t.translate("hint_first_name"),
                                        editingController: controller.firstName,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText: t.translate(
                                                "dynamic_field_required",
                                                args: [
                                                  t.translate("lbl_first_name"),
                                                ],
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
                                        inputHint:
                                            t.translate("hint_last_name"),
                                        editingController: controller.lastName,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText: t.translate(
                                                "dynamic_field_required",
                                                args: [
                                                  t.translate("lbl_last_name"),
                                                ],
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
                                  headerWidget: InputHeader(
                                    headerLabel:
                                        t.translate("lbl_display_name"),
                                  ),
                                  inputHint: t.translate("hint_display_name"),
                                  editingController: controller.displayName,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                controller.accountType == 2
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: true,
                                              headerLabel: t.translate(
                                                  "veterinarian_special"),
                                            ),
                                            inputHint:
                                                t.translate("hint_specialty"),
                                            editingController:
                                                controller.specialty,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText: t.translate(
                                                    "dynamic_field_required",
                                                    args: [
                                                      t.translate(
                                                          "veterinarian_special"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).call,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          )
                                        ],
                                      )
                                    : const SizedBox(),
                                InputField(
                                  headerWidget: InputHeader(
                                    compulsory: true,
                                    headerLabel: t.translate("lbl_email"),
                                  ),
                                  inputHint: t.translate("hint_email"),
                                  editingController: controller.email,
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(
                                        errorText: t.translate(
                                          "dynamic_field_required",
                                          args: [
                                            t.translate("lbl_email"),
                                          ],
                                        ),
                                      ),
                                      EmailValidator(
                                        errorText: t.translate('invalid_email'),
                                      ),
                                    ],
                                  ).call,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                PhoneInput(
                                  isCompulsory: true,
                                  headerLabel: t.translate("lbl_parent_phone"),
                                  countryDialCode: controller.pickedCode != null
                                      ? controller.pickedCode?.code
                                      : t.appLocale.countryCode,
                                  editingController: controller.phoneNumber,
                                  onCountryChanged: (countryCode) => controller
                                      .onChangeCountry(countryCode, 1),
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(
                                        errorText: t.translate(
                                          "dynamic_field_required",
                                          args: [
                                            t.translate("lbl_parent_phone"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).call,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                controller.accountType == 1
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: SelectorField(
                                                  headerWidget: InputHeader(
                                                    headerLabel: t.translate(
                                                        "lbl_gender"),
                                                  ),
                                                  inputHint:
                                                      controller.gender != ''
                                                          ? controller.gender
                                                          : t.translate(
                                                              "hint_gender"),
                                                  suffixIcon: Icon(
                                                    Entypo.chevron_down,
                                                    size: 26.sp,
                                                    color: AppColors.hintColor,
                                                  ),
                                                  onSelectItem: () => controller
                                                      .openGenderPicker(),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel:
                                                        t.translate("lbl_age"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_age"),
                                                  editingController:
                                                      controller.age,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                PasswordField(
                                  headerLabel: t.translate("lbl_password"),
                                  inputHint: t.translate("hint_password"),
                                  editingController: controller.password,
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(
                                        errorText: t.translate(
                                          "dynamic_field_required",
                                          args: [
                                            t.translate("lbl_password"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).call,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                controller.accountType == 1
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            t.translate("home_address"),
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            inputHint: t.translate(
                                                "hint_street_address"),
                                            editingController:
                                                controller.addressOne,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            inputHint: t.translate(
                                                "hint_street_address_two"),
                                            editingController:
                                                controller.addressTwo,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel:
                                                        t.translate("lbl_city"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_city"),
                                                  editingController:
                                                      controller.city,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel: t.translate(
                                                        "lbl_province"),
                                                  ),
                                                  inputHint: t.translate(
                                                      "hint_province"),
                                                  editingController:
                                                      controller.province,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          PhoneInput(
                                            headerLabel: t.translate(
                                                "lbl_secondary_phone"),
                                            countryDialCode: controller
                                                        .pickedCodeSecondary !=
                                                    null
                                                ? controller
                                                    .pickedCodeSecondary?.code
                                                : t.appLocale.countryCode,
                                            editingController:
                                                controller.alternatePhone,
                                            onCountryChanged: (countryCode) =>
                                                controller.onChangeCountry(
                                                    countryCode, 2),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            isMultiline: true,
                                            headerWidget: InputHeader(
                                              headerLabel: t.translate(
                                                "lbl_mailing_address",
                                              ),
                                            ),
                                            inputHint: t.translate(
                                              "hint_mailing_address",
                                            ),
                                            editingController:
                                                controller.mailingAddress,
                                          ),
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InputField(
                                            headerWidget: InputHeader(
                                              headerLabel: t.translate(
                                                  "lbl_qualification"),
                                            ),
                                            inputHint: t.translate(
                                                "hint_qualification"),
                                            editingController:
                                                controller.qualification,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              headerLabel: t.translate(
                                                  "lbl_profile_summary"),
                                            ),
                                            inputHint:
                                                t.translate("hint_summary"),
                                            editingController:
                                                controller.profileSummary,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              headerLabel:
                                                  t.translate("lbl_license_no"),
                                            ),
                                            inputHint:
                                                t.translate("hint_license_no"),
                                            editingController:
                                                controller.licenseNo,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          SelectorField(
                                            headerWidget: InputHeader(
                                              headerLabel: t.translate(
                                                  "lbl_license_end_date"),
                                            ),
                                            inputHint:
                                                controller.expirationDate != ''
                                                    ? controller.expirationDate
                                                    : t.translate(
                                                        "hint_select_date"),
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
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          SelectorField(
                                            documentUploader: true,
                                            headerWidget: InputHeader(
                                              compulsory: true,
                                              headerLabel:
                                                  t.translate("hint_document"),
                                            ),
                                            inputHint: controller.pickedFile !=
                                                    null
                                                ? t.translate("file_selected")
                                                : t.translate("lbl_document"),
                                            suffixIcon: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.secondary,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    10.sp,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    10.sp,
                                                  ),
                                                ),
                                              ),
                                              width: 60.w,
                                              height: 48.h,
                                              padding: EdgeInsets.all(
                                                10.sp,
                                              ),
                                              child: SvgPicture.asset(
                                                AppAssets.icUpload,
                                                height: 18.sp,
                                                width: 18.sp,
                                              ),
                                            ),
                                            onSelectItem: () =>
                                                controller.openFilePicker(),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: true,
                                              headerLabel:
                                                  t.translate("lbl_experience"),
                                            ),
                                            inputHint:
                                                t.translate("hint_experience"),
                                            editingController:
                                                controller.experience,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText: t.translate(
                                                    "dynamic_field_required",
                                                    args: [
                                                      t.translate(
                                                          "lbl_experience"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).call,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              headerLabel: t.translate(
                                                  "lbl_language_spoken"),
                                            ),
                                            inputHint:
                                                t.translate("hint_languages"),
                                            editingController:
                                                controller.spokenLanguages,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              headerLabel:
                                                  t.translate("lbl_consent"),
                                            ),
                                            inputHint:
                                                t.translate("hint_consent"),
                                            editingController:
                                                controller.consent,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              headerLabel:
                                                  t.translate("lbl_address"),
                                            ),
                                            inputHint:
                                                t.translate("hint_address"),
                                            editingController:
                                                controller.address,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: true,
                                              headerLabel:
                                                  t.translate("location"),
                                            ),
                                            inputHint:
                                                t.translate("hint_location"),
                                            editingController:
                                                controller.location,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText: t.translate(
                                                    "dynamic_field_required",
                                                    args: [
                                                      t.translate("location"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).call,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel:
                                                        t.translate("lbl_city"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_city"),
                                                  editingController:
                                                      controller.city,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel: t
                                                        .translate("lbl_state"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_state"),
                                                  editingController:
                                                      controller.province,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel: t.translate(
                                                        "lbl_country"),
                                                  ),
                                                  inputHint: t.translate(
                                                      "hint_country"),
                                                  editingController:
                                                      controller.country,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    headerLabel:
                                                        t.translate("lbl_zip"),
                                                  ),
                                                  inputHint: t.translate(
                                                      "hint_zip_code"),
                                                  editingController:
                                                      controller.zipCode,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: ButtonView(
                                    onTap: () {
                                      // if (controller.formKey.currentState!
                                      //     .validate()) {
                                      //   Navigator.pushNamed(
                                      //     context,
                                      //     verification,
                                      //   );
                                      // }
                                      Navigator.pushNamed(
                                        context,
                                        verification,
                                      );
                                    },
                                    buttonTitle: t.translate("sign_up"),
                                    width: width - 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(
                                    context,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        t.translate("already_account"),
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              height: 1.2,
                                              letterSpacing: 0.20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        t.translate("btn_login"),
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              height: 1.2,
                                              color: AppColors.secondary,
                                              fontSize: 16.0.sp,
                                              letterSpacing: 0.20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
