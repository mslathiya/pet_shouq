import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/config/config.dart';

import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class SpecialNotes extends StatefulWidget {
  const SpecialNotes({super.key});

  @override
  State<SpecialNotes> createState() => _SpecialNotesState();
}

class _SpecialNotesState extends State<SpecialNotes> {
  late PetInformation info;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      info = argumentData[0]['info'];
      setState(() {
        info;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "special_needs".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                ),
                child: info.petSpecialNeed != null
                    ? Html(
                        data: info.petSpecialNeed,
                      )
                    : Container(),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonView(
                onTap: () => Get.offNamed(petAddSpecialNotes, arguments: [
                  {
                    "info": info.petSpecialNeed,
                  }
                ]),
                buttonTitle: "screen_add_special_notes".tr,
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
