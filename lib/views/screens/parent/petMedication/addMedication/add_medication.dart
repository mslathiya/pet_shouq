import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddMedication extends StatefulWidget {
  const AddMedication({super.key});

  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_add_medication"),
        onPressBack: () => Navigator.pop(context),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: true,
                          headerLabel: t.translate("lbl_medication_name"),
                        ),
                        inputHint: t.translate("hint_medication_name"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SelectorField(
                        headerWidget: InputHeader(
                          compulsory: true,
                          headerLabel: t.translate("lbl_medication_type"),
                        ),
                        inputHint: t.translate("hint_medication_type"),
                        suffixIcon: SizedBox(
                          width: 26.w,
                          height: 26.h,
                          child: Icon(
                            Entypo.chevron_down,
                            size: 26.sp,
                            color: AppColors.hintColor,
                          ),
                        ),
                        onSelectItem: () {},
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("lbl_veterinarian"),
                        ),
                        inputHint: t.translate("hint_veterinarian"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: true,
                          headerLabel: t.translate("lbl_pet_name"),
                        ),
                        inputHint: t.translate("hint_pet_name"),
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
                                headerLabel: t.translate("lbl_species"),
                              ),
                              inputHint: t.translate("hint_species"),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: InputField(
                              headerWidget: InputHeader(
                                compulsory: false,
                                headerLabel: t.translate("lbl_dosage"),
                              ),
                              inputHint: t.translate("hint_dosage"),
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
                                compulsory: false,
                                headerLabel: t.translate("lbl_frequency"),
                              ),
                              inputHint: t.translate("hint_frequency"),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: InputField(
                              headerWidget: InputHeader(
                                compulsory: false,
                                headerLabel: t.translate("lbl_duration"),
                              ),
                              inputHint: t.translate("hint_duration"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("prescription_reason"),
                        ),
                        inputHint: t.translate("hint_administrative_info"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("administrative_info"),
                        ),
                        inputHint: t.translate("hint_administrative_info"),
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
                              inputHint: t.translate("lbl_start_date"),
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("hint_select_date"),
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
                              onSelectItem: () {},
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: SelectorField(
                              inputHint: t.translate("lbl_end_date"),
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("hint_select_date"),
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
                          compulsory: false,
                          headerLabel: t.translate("lbl_refills"),
                        ),
                        inputHint: t.translate("hint_refills"),
                        compulsory: true,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        isMultiline: true,
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("special_notes"),
                        ),
                        inputHint: t.translate("hint_special_note"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ButtonView(
                          onTap: () => Navigator.pop(
                            context,
                          ),
                          buttonTitle: t.translate("btn_save"),
                          width: width - 20,
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
          );
        },
      ),
    );
  }
}
