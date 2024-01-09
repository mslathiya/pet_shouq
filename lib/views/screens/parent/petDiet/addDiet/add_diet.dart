import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddDiet extends StatefulWidget {
  const AddDiet({super.key});

  @override
  State<AddDiet> createState() => _AddDietState();
}

class _AddDietState extends State<AddDiet> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_add_diet_log"),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("lbl_food_type"),
                        ),
                        inputHint: t.translate("hint_food_type"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SelectorField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("date"),
                        ),
                        inputHint: t.translate("hint_select_date"),
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
                      SelectorField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("lbl_meal_time"),
                        ),
                        inputHint: t.translate("hint_meal_time"),
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
                          headerLabel: t.translate("lbl_portion_size"),
                        ),
                        inputHint: t.translate("hint_portion_size"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("lbl_special_instruction"),
                        ),
                        inputHint: t.translate("hint_special_instruction"),
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
                                headerLabel: t.translate("lbl_water"),
                              ),
                              inputHint: t.translate("hint_water"),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: InputField(
                              headerWidget: InputHeader(
                                compulsory: false,
                                headerLabel: t.translate("lbl_weight_value"),
                              ),
                              inputHint: t.translate("hint_weight"),
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
