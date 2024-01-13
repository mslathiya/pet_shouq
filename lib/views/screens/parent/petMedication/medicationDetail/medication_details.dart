import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/dosage_info.dart';
import 'widgets/medication_info.dart';
import 'widgets/other_specification.dart';

class MedicationDetails extends StatelessWidget {
  const MedicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("medication_details"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MedicationInfo(),
            SingleLabelItem(
              title: t.translate("date_nutrition"),
              subTitle: "2023-05-01 To  2023-05-14 / 14 days",
              asset: AppAssets.icCalendar,
            ),
            const DosageInfo(),
            OtherSpecification(
              title: t.translate("prescription_reason"),
              description: "Osteoarthritis pain",
            ),
            OtherSpecification(
              title: t.translate("administrative_info"),
              description: "Administer with food",
            ),
            OtherSpecification(
              title: t.translate("special_notes"),
              description: "Watch for any signs of gastrointestinal upset.",
            ),
          ],
        ),
      ),
    );
  }
}
