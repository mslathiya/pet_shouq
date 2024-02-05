import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models.dart';
import '../../../../components/components.dart';

class MedicalDetails extends StatelessWidget {
  const MedicalDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableBox(
      title: "pet_medication_details".tr,
      infoList: [
        MedicalInfo(
          title: "lbl_medication_name".tr,
          description: "Rimadyl",
        ),
        MedicalInfo(
          title: "lbl_medication_type".tr,
          description: "Tablet",
        ),
        MedicalInfo(
          title: "lbl_veterinarian".tr,
          description: "Dr. Smith",
        ),
        MedicalInfo(
          title: "lbl_species".tr,
          description: "Dog",
        ),
        MedicalInfo(
          title: "lbl_dosage".tr,
          description: "25mg",
        ),
        MedicalInfo(
          title: "lbl_frequency".tr,
          description: "Once daily",
        ),
        MedicalInfo(
          title: "lbl_duration".tr,
          description: "14 days",
        ),
        MedicalInfo(
          title: "prescription_reason".tr,
          description: "Osteoarthritis pain",
        ),
        MedicalInfo(
          title: "administrative_info".tr,
          description: "Administer with food",
        ),
        MedicalInfo(
          title: "lbl_start_date".tr,
          description: "01-Jan-2024",
        ),
        MedicalInfo(
          title: "lbl_end_date".tr,
          description: "15-Jan-2024",
        ),
        MedicalInfo(
          title: "lbl_refills".tr,
          description: "None",
        ),
        MedicalInfo(
          title: "special_notes".tr,
          description: "Watch for any signs of gastrointestinal upset.",
        ),
      ],
    );
  }
}
