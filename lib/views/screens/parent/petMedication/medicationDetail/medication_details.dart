import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/models.dart';
import '../../../../../helper/helpers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/dosage_info.dart';
import 'widgets/pet_info.dart';
import 'widgets/other_specification.dart';

class MedicationDetails extends StatefulWidget {
  const MedicationDetails({super.key});

  @override
  State<MedicationDetails> createState() => _MedicationDetailsState();
}

class _MedicationDetailsState extends State<MedicationDetails> {
  late MedicationInfo info;
  late int index;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      index = argumentData[0]['index'];
      info = argumentData[1]['info'];
      setState(() {
        info;
        index;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithBack(
        title: "medication_details".tr,
        onPressBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PetInfo(
              info: info,
            ),
            SingleLabelItem(
              title: "date_nutrition".tr,
              subTitle:
                  "${DateFormat("yyyy-MM-dd").format(info.mediStartDate ?? DateTime.now())} To ${DateFormat("yyyy-MM-dd").format(info.mediEndDate ?? DateTime.now())} / ${info.mediEndDate?.difference(info.mediStartDate ?? DateTime.now()).inDays} days",
              asset: AppAssets.icCalendar,
            ),
            DosageInfo(
              info: info,
            ),
            if (CommonHelper.isNotEmpty(info.mediReasonPrescription))
              OtherSpecification(
                title: "prescription_reason".tr,
                description: info.mediReasonPrescription ?? "",
              ),
            if (CommonHelper.isNotEmpty(info.mediAdminInstruction))
              OtherSpecification(
                title: "administrative_info".tr,
                description: info.mediAdminInstruction ?? "",
              ),
            if (CommonHelper.isNotEmpty(info.mediSpecialNotes))
              OtherSpecification(
                title: "special_notes".tr,
                description: info.mediSpecialNotes ?? "",
              ),
          ],
        ),
      ),
    );
  }
}
