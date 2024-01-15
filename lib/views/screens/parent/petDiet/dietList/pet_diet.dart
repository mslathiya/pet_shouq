import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetDiet extends StatefulWidget {
  const PetDiet({super.key});

  @override
  State<PetDiet> createState() => _PetDietState();
}

class _PetDietState extends State<PetDiet> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        title: t.translate("screen_diet_log"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Bottom List
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                padding: EdgeInsets.only(
                  top: 10.sp,
                  bottom: 15.sp,
                ),
                itemBuilder: (_, index) {
                  return DietListItem(
                    itemIndex: index,
                    onViewDetail: () {
                      Navigator.pushNamed(context, petDietDetail);
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
                onTap: () => Navigator.pushNamed(context, petAddDiet),
                buttonTitle: t.translate("screen_add_diet_log"),
                width: width - 20,
                buttonStyle: TextStyle(
                  fontSize: 9.sp,
                ),
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
            Platform.isAndroid
                ? SizedBox(
                    height: 15.h,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
