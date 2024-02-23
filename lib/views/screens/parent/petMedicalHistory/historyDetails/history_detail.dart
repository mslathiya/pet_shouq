import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models.dart';
import '../../../../components/components.dart';
import 'widgets/history_information.dart';

class MedicalHistoryDetail extends StatefulWidget {
  const MedicalHistoryDetail({super.key});

  @override
  State<MedicalHistoryDetail> createState() => _MedicalHistoryDetailState();
}

class _MedicalHistoryDetailState extends State<MedicalHistoryDetail> {
  late HistoryDetails info;
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
        title: "medical_history".tr,
        onPressBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HistoryInformation(
                bean: info.pet,
                userBean: null,
                historyId: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
