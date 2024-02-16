import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/dosage_info.dart';
import 'widgets/pet_info.dart';
import 'widgets/other_specification.dart';

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
          ],
        ),
      ),
    );
  }
}
