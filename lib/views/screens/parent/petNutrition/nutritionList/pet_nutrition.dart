import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetNutrition extends StatefulWidget {
  const PetNutrition({super.key});

  @override
  State<PetNutrition> createState() => _PetNutritionState();
}

class _PetNutritionState extends State<PetNutrition> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        title: t.translate("nutrition_feeding"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                padding: EdgeInsets.only(
                  top: 10.sp,
                  bottom: 15.sp,
                ),
                itemBuilder: (_, index) {
                  return NutritionListItem(
                    t: t,
                    onViewDetail: () {
                      Navigator.pushNamed(context, petNutritionDetail);
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonView(
                onTap: () => Navigator.pushNamed(context, petAddNutrition),
                buttonTitle: t.translate("screen_nutrition_feeding"),
                width: width - 20,
                buttonStyle: TextStyle(fontSize: 9.sp),
                leftWidget: Padding(
                  padding: EdgeInsets.only(
                    right: 5.w,
                  ),
                  child: Icon(
                    Entypo.plus,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
