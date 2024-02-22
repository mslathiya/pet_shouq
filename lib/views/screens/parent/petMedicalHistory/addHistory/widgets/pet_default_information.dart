import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/components.dart';

class PetDefaultInformation extends StatelessWidget {
  const PetDefaultInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          isFilled: true,
          enableInput: false,
          headerWidget: InputHeader(
            compulsory: false,
            headerLabel: "lbl_pet_name".tr,
          ),
          inputHint: "hint_pet_name".tr,
        ),
        SizedBox(
          height: 15.h,
        ),
        InputField(
          isFilled: true,
          enableInput: false,
          headerWidget: InputHeader(
            compulsory: false,
            headerLabel: "lbl_breed".tr,
          ),
          inputHint: "hint_breed".tr,
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Expanded(
              child: InputField(
                isFilled: true,
                enableInput: false,
                headerWidget: InputHeader(
                  compulsory: false,
                  headerLabel: "lbl_age".tr,
                ),
                inputHint: "hint_age".tr,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: InputField(
                isFilled: true,
                enableInput: false,
                headerWidget: InputHeader(
                  compulsory: false,
                  headerLabel: "lbl_gender".tr,
                ),
                inputHint: "hint_gender".tr,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        InputField(
          isFilled: true,
          enableInput: false,
          headerWidget: InputHeader(
            compulsory: false,
            headerLabel: "lbl_marking".tr,
          ),
          inputHint: "hint_marking".tr,
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Expanded(
              child: InputField(
                isFilled: true,
                enableInput: false,
                headerWidget: InputHeader(
                  compulsory: false,
                  headerLabel: "lbl_weight".tr,
                ),
                inputHint: "hint_weight".tr,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: InputField(
                isFilled: true,
                enableInput: false,
                headerWidget: InputHeader(
                  compulsory: false,
                  headerLabel: "lbl_chip_no".tr,
                ),
                inputHint: "hint_chip_no".tr,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
