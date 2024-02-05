import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widget/appointment_header.dart';
import 'widget/detail_buttons.dart';
import 'widget/diet_details.dart';
import 'widget/feeding_detail.dart';
import 'widget/medical_detail.dart';
import 'widget/medical_history.dart';
import 'widget/nutrition_detail.dart';
import 'widget/tab_selector.dart';
import 'widget/vaccine_info.dart';

class VetAppointmentDetail extends StatefulWidget {
  const VetAppointmentDetail({super.key});

  @override
  State<VetAppointmentDetail> createState() => _VetAppointmentDetailState();
}

class _VetAppointmentDetailState extends State<VetAppointmentDetail> {
  int _currentIndex = 0;

  final List<String> _tabList = [
    "vaccination",
    "medical_history",
    "medical_details",
    "nutrition_feeding",
    "screen_diet_log",
    "screen_feeding_schedule",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        title: "screen_details".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppointmentInfo(),
              SingleLabelItem(
                title: "date_time".tr,
                subTitle: "01-Jan-2024, 4:00 PM",
                asset: AppAssets.icCalendar,
              ),
              DetailButtons(
                onScheduleAppointment: _dialogBuilder,
              ),
              TabSelector(
                tabList: _tabList,
                currentIndex: _currentIndex,
                onTapMenu: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              _renderWidgetByIndex(_currentIndex)
            ],
          ),
        ),
      ),
    );
  }

  void _dialogBuilder() {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return const ReScheduleAppointment(
          selectDoctor: false,
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  _renderWidgetByIndex(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const VaccinationDetails();
      case 1:
        return const MedicalHistory();
      case 2:
        return const MedicalDetails();
      case 3:
        return const NutritionFeedingDetail();
      case 4:
        return const DietDetails();
      case 5:
        return const FeedingDetail();
      default:
        return const SizedBox();
    }
  }
}
