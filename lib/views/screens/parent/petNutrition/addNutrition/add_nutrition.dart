import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddNutrition extends StatefulWidget {
  const AddNutrition({super.key});

  @override
  State<AddNutrition> createState() => _AddNutritionState();
}

class _AddNutritionState extends State<AddNutrition> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_nutrition_feeding"),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_food_name"),
                          ),
                          inputHint: t.translate("hint_food_name"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_brand"),
                          ),
                          inputHint: t.translate("hint_brand"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SelectorField(
                          headerWidget: InputHeader(
                            compulsory: true,
                            headerLabel: t.translate("lbl_food_type"),
                          ),
                          inputHint: t.translate("hint_food_type"),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("lbl_life_stage"),
                                ),
                                inputHint: t.translate("hint_life_stage"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("lbl_species"),
                                ),
                                inputHint: t.translate("hint_species"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("ingredients"),
                                ),
                                inputHint: t.translate("hint_ingredients"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InputField(
                                    headerWidget: InputHeader(
                                      compulsory: false,
                                      headerLabel:
                                          t.translate("lbl_nutrition_content"),
                                    ),
                                    inputHint:
                                        t.translate("hint_nutrition_content"),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    t.translate("per_gram", args: ['100']),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.hintColor),
                                  ),
                                ],
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
                                  headerLabel: t.translate("protein"),
                                ),
                                inputHint: t.translate("hint_protein"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("fat"),
                                ),
                                inputHint: t.translate("hint_fat"),
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
                                  headerLabel: t.translate("carbohydrates"),
                                ),
                                inputHint: t.translate("hint_carbohydrates"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("fiber"),
                                ),
                                inputHint: t.translate("hint_fiber"),
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
                                  headerLabel: t.translate("calories"),
                                ),
                                inputHint: t.translate("hint_calories"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("vitamins"),
                                ),
                                inputHint: t.translate("hint_vitamins"),
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
                                  headerLabel: t.translate("minerals"),
                                ),
                                inputHint: t.translate("hint_mineral"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("omega_three"),
                                ),
                                inputHint: t.translate("hint_omega_three"),
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
                                  headerLabel: t.translate("omega_six"),
                                ),
                                inputHint: t.translate("hint_omega_six"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: InputField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("guidelines"),
                                ),
                                inputHint: t.translate("hint_guideline"),
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
                            headerLabel: t.translate("small_breed"),
                          ),
                          inputHint: t.translate("hint_lbs"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("large_breed"),
                          ),
                          inputHint: t.translate("hint_lbs"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("special_feature"),
                          ),
                          inputHint: t.translate("hint_feature"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputField(
                          headerWidget: InputHeader(
                            compulsory: false,
                            headerLabel: t.translate("lbl_price"),
                          ),
                          inputHint: t.translate("hint_price"),
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
                            buttonTitle: t.translate("btn_submit"),
                            width: width - 20,
                            buttonStyle: TextStyle(
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                      ],
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
