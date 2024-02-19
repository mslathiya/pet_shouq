import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/models.dart';
import '../../../../../helper/helpers.dart';
import '../../../../components/components.dart';
import 'widgets/pet_info.dart';

class VaccinationDetails extends StatefulWidget {
  const VaccinationDetails({super.key});

  @override
  State<VaccinationDetails> createState() => _VaccinationDetailsState();
}

class _VaccinationDetailsState extends State<VaccinationDetails> {
  late VaccinationDetail info;
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
        title: "vaccination".tr,
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
            ExpandableBox(
              initiallyExpanded: true,
              infoList: [
                if (CommonHelper.isNotEmpty(info.vacPetSpecies))
                  MedicalInfo(
                    title: "lbl_species".tr,
                    description: info.vacPetSpecies ?? "",
                  ),
                if (CommonHelper.isNotEmpty(info.vacName))
                  MedicalInfo(
                    title: "vaccination_name".tr,
                    description: info.vacName ?? "",
                  ),
                if (CommonHelper.isNotEmpty(info.vacType))
                  MedicalInfo(
                    title: "vaccination_type".tr,
                    description: info.vacType ?? "",
                  ),
                if (info.vacDate != null)
                  MedicalInfo(
                    title: "vaccination_date".tr,
                    description: DateFormat("yyyy-MM-dd")
                        .format(info.vacDate ?? DateTime.now()),
                  ),
                if (info.vacDueDate != null)
                  MedicalInfo(
                    title: "next_due_date".tr,
                    description: DateFormat("yyyy-MM-dd")
                        .format(info.vacDueDate ?? DateTime.now()),
                  ),
                if (CommonHelper.isNotEmpty(info.vacProvider))
                  MedicalInfo(
                    title: "vaccination_provider".tr,
                    description: info.vacProvider ?? "",
                  ),
                if (CommonHelper.isNotEmpty(info.vacLotNumber))
                  MedicalInfo(
                    title: "vaccination_lot_no".tr,
                    description: info.vacLotNumber ?? "",
                  ),
                if (CommonHelper.isNotEmpty(info.vacCertificateId))
                  MedicalInfo(
                    title: "vaccination_id".tr,
                    description: info.vacCertificateId ?? "",
                  ),
              ],
              title: "pet_vaccination_detail".tr,
            ),
          ],
        ),
      ),
    );
  }
}
