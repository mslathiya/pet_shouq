import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../components/components.dart';
import 'widgets/dosage_info.dart';
import 'widgets/medication_date_time.dart';
import 'widgets/medication_info.dart';
import 'widgets/other_specification.dart';

class MedicationDetails extends StatelessWidget {
  const MedicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("medication"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MedicationInfo(),
            const MedicationDateTime(),
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