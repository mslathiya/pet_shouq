import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/models.dart';
import 'info_field.dart';

class PetDefaultInformation extends StatelessWidget {
  const PetDefaultInformation({
    super.key,
    required this.information,
    required this.userData,
  });
  final PetInformation information;
  final UserBean? userData;

  @override
  Widget build(BuildContext context) {
    String age = (DateTime.now().year - information.petDob!.year).toString();
    return Column(
      children: [
        InfoField(
          inputHeader: "lbl_pet_name".tr,
          inputValue: information.petName ?? "",
        ),
        SizedBox(
          height: 15.h,
        ),
        InfoField(
          inputHeader: "hint_breed".tr,
          inputValue: information.petBreed ?? "",
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Expanded(
              child: InfoField(
                inputHeader: "lbl_age".tr,
                inputValue: "$age ${"years".tr}",
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: InfoField(
                inputHeader: "lbl_gender".tr,
                inputValue: userData?.parent?.parentSex ?? "",
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        InfoField(
          inputHeader: "lbl_marking".tr,
          inputValue: information.petColor ?? "",
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Expanded(
              child: InfoField(
                inputHeader: "lbl_weight".tr,
                inputValue: information.petWeight ?? "",
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: InfoField(
                inputHeader: "lbl_chip_no".tr,
                inputValue: information.petMicrochipNumber ?? "",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
