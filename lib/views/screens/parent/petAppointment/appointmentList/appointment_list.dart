import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../components/components.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        withSearch: true,
        title: "screen_appointment_booking".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 15,
          padding: EdgeInsets.only(
            top: 10.sp,
            bottom: 15.sp,
          ),
          itemBuilder: (_, index) {
            return AppointmentListItem(
              onViewDetail: () {
                Get.toNamed(petBookingDetails);
              },
            );
          },
        ),
      ),
    );
  }
}
