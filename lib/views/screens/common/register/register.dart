import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widget/radio_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.bottom;

    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: IntrinsicHeight(
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
                                  selectedOption: selectedOption,
                                  onSelectOption: ((index) {
                                    setState(() {
                                      selectedOption = index;
                                    });
                                  }),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomImagePicker(
                                  onPickImage: () => showImagePicker(
                                    context,
                                    t,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InputHeader(
                                  compulsory: true,
                                  headerLabel: selectedOption == 1
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
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: InputField(
                                        inputHint:
                                            t.translate("hint_last_name"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                selectedOption == 2
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel: t.translate(
                                                  "lbl_display_name"),
                                            ),
                                            inputHint: t
                                                .translate("hint_display_name"),
                                            compulsory: true,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: true,
                                              headerLabel: t.translate(
                                                  "veterinarian_special"),
                                            ),
                                            inputHint:
                                                t.translate("hint_specialty"),
                                            compulsory: true,
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
                                  compulsory: true,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                PhoneInput(
                                  isCompulsory: true,
                                  headerLabel: t.translate("lbl_parent_phone"),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                selectedOption == 1
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
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel: t.translate(
                                                        "lbl_gender"),
                                                  ),
                                                  inputHint: t
                                                      .translate("hint_gender"),
                                                  suffixIcon: SizedBox(
                                                    width: 24.w,
                                                    height: 24.h,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Entypo.chevron_down,
                                                        size: 26.sp,
                                                        color:
                                                            AppColors.hintColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel:
                                                        t.translate("lbl_age"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_age"),
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
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                selectedOption == 1
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
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            inputHint: t.translate(
                                                "hint_street_address_two"),
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
                                                    compulsory: false,
                                                    headerLabel:
                                                        t.translate("lbl_city"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_city"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel: t.translate(
                                                        "lbl_province"),
                                                  ),
                                                  inputHint: t.translate(
                                                      "hint_province"),
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
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel: t.translate(
                                                  "lbl_display_name"),
                                            ),
                                            inputHint: t
                                                .translate("hint_display_name"),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            isMultiline: true,
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel: t.translate(
                                                  "lbl_mailing_address"),
                                            ),
                                            inputHint: t.translate(
                                                "hint_mailing_address"),
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
                                              compulsory: false,
                                              headerLabel: t.translate(
                                                  "lbl_qualification"),
                                            ),
                                            inputHint: t.translate(
                                                "hint_qualification"),
                                            compulsory: true,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel: t.translate(
                                                  "lbl_profile_summary"),
                                            ),
                                            inputHint:
                                                t.translate("hint_summary"),
                                            compulsory: true,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel:
                                                  t.translate("lbl_license_no"),
                                            ),
                                            inputHint:
                                                t.translate("hint_license_no"),
                                            compulsory: true,
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
                                                child: SelectorField(
                                                  inputHint: t.translate(
                                                      "hint_select_date"),
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel: t.translate(
                                                        "lbl_license_start_date"),
                                                  ),
                                                  suffixIcon: SizedBox(
                                                    width: 24.w,
                                                    height: 24.h,
                                                    child: SvgPicture.asset(
                                                      AppAssets.icCalendar,
                                                      height: 18.sp,
                                                      width: 18.sp,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        AppColors.hintColor,
                                                        BlendMode.srcIn,
                                                      ),
                                                    ),
                                                  ),
                                                  onSelectItem: () {},
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: SelectorField(
                                                  inputHint: t.translate(
                                                      "hint_select_date"),
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel: t.translate(
                                                        "lbl_license_end_date"),
                                                  ),
                                                  suffixIcon: SizedBox(
                                                    width: 24.w,
                                                    height: 24.h,
                                                    child: SvgPicture.asset(
                                                      AppAssets.icCalendar,
                                                      height: 18.sp,
                                                      width: 18.sp,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        AppColors.hintColor,
                                                        BlendMode.srcIn,
                                                      ),
                                                    ),
                                                  ),
                                                  onSelectItem: () {},
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          SelectorField(
                                            documentUploader: true,
                                            inputHint:
                                                t.translate("lbl_document"),
                                            headerWidget: InputHeader(
                                              compulsory: true,
                                              headerLabel:
                                                  t.translate("hint_document"),
                                            ),
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
                                            onSelectItem: () {},
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
                                            compulsory: true,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel: t.translate(
                                                  "lbl_language_spoken"),
                                            ),
                                            inputHint:
                                                t.translate("hint_languages"),
                                            compulsory: true,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel:
                                                  t.translate("lbl_consent"),
                                            ),
                                            inputHint:
                                                t.translate("hint_consent"),
                                            compulsory: true,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          InputField(
                                            headerWidget: InputHeader(
                                              compulsory: false,
                                              headerLabel:
                                                  t.translate("lbl_address"),
                                            ),
                                            inputHint:
                                                t.translate("hint_address"),
                                            compulsory: true,
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
                                            compulsory: true,
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
                                                    compulsory: false,
                                                    headerLabel:
                                                        t.translate("lbl_city"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_city"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel: t
                                                        .translate("lbl_state"),
                                                  ),
                                                  inputHint:
                                                      t.translate("hint_state"),
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
                                                    compulsory: false,
                                                    headerLabel: t.translate(
                                                        "lbl_country"),
                                                  ),
                                                  inputHint: t.translate(
                                                      "hint_country"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: InputField(
                                                  headerWidget: InputHeader(
                                                    compulsory: false,
                                                    headerLabel:
                                                        t.translate("lbl_zip"),
                                                  ),
                                                  inputHint: t.translate(
                                                      "hint_zip_code"),
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
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      verification,
                                    ),
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
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: safePadding,
              )
            ],
          );
        },
      ),
    );
  }

  void showImagePicker(BuildContext context, ApplicationLocalizations locale) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 130.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 15.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await ImagePicker().pickImage(source: ImageSource.camera);
                    },
                    icon: Icon(
                      MaterialIcons.camera,
                      size: 46.sp,
                      color: AppColors.gray,
                    ),
                  ),
                  Text(
                    "Camera",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
              ),
              child: VerticalDivider(color: AppColors.grayFaded),
            ),
            SizedBox(
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                    },
                    icon: Icon(
                      MaterialIcons.add_photo_alternate,
                      size: 46.sp,
                      color: AppColors.gray,
                    ),
                  ),
                  Text(
                    "Gallery",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      constraints: BoxConstraints(maxHeight: 180.h),
    );
  }
}
