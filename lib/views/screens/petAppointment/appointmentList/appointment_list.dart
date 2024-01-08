import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../components/components.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        title: t.translate("screen_appointment_booking"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: ListView.builder(
        itemCount: 15,
        padding: EdgeInsets.only(
          top: 10.sp,
          bottom: 15.sp,
        ),
        itemBuilder: (_, index) {
          return AppointmentListItem(
            t: t,
            onViewDetail: () {
              Navigator.pushNamed(context, petBookingDetails);
            },
          );
        },
      ),
    );
  }
}
