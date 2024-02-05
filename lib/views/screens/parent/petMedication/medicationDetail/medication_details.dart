import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/dosage_info.dart';
import 'widgets/medication_info.dart';
import 'widgets/other_specification.dart';

class MedicationDetails extends StatelessWidget {
  const MedicationDetails({super.key});

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
            const MedicationInfo(),
            SingleLabelItem(
              title: "date_nutrition".tr,
              subTitle: "2023-05-01 To  2023-05-14 / 14 days",
              asset: AppAssets.icCalendar,
            ),
            const DosageInfo(),
            OtherSpecification(
              title: "prescription_reason".tr,
              description: "Osteoarthritis pain",
            ),
            OtherSpecification(
              title: "administrative_info".tr,
              description: "Administer with food",
            ),
            OtherSpecification(
              title: "special_notes".tr,
              description: "Watch for any signs of gastrointestinal upset.",
            ),
          ],
        ),
      ),
    );
  }
}
