import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../../data/models.dart';
import 'expandable_box.dart';

class MedicalDetails extends StatelessWidget {
  const MedicalDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return ExpandableBox(
      title: t.translate("pet_medication_details"),
      infoList: [
        MedicalInfo(
          title: t.translate("lbl_medication_name"),
          description: "Rimadyl",
        ),
        MedicalInfo(
          title: t.translate("lbl_medication_type"),
          description: "Tablet",
        ),
        MedicalInfo(
          title: t.translate("lbl_veterinarian"),
          description: "Dr. Smith",
        ),
        MedicalInfo(
          title: t.translate("lbl_species"),
          description: "Dog",
        ),
        MedicalInfo(
          title: t.translate("lbl_dosage"),
          description: "25mg",
        ),
        MedicalInfo(
          title: t.translate("lbl_frequency"),
          description: "Once daily",
        ),
        MedicalInfo(
          title: t.translate("lbl_duration"),
          description: "14 days",
        ),
        MedicalInfo(
          title: t.translate("prescription_reason"),
          description: "Osteoarthritis pain",
        ),
        MedicalInfo(
          title: t.translate("administrative_info"),
          description: "Administer with food",
        ),
        MedicalInfo(
          title: t.translate("lbl_start_date"),
          description: "01-Jan-2024",
        ),
        MedicalInfo(
          title: t.translate("lbl_end_date"),
          description: "15-Jan-2024",
        ),
        MedicalInfo(
          title: t.translate("lbl_refills"),
          description: "None",
        ),
        MedicalInfo(
          title: t.translate("special_notes"),
          description: "Watch for any signs of gastrointestinal upset.",
        ),
      ],
    );
  }
}
