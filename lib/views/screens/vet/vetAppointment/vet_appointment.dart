import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../data/enum/enums.dart';
import '../../../components/components.dart';
import 'widget/app_bar_widget.dart';
import 'widget/header_view.dart';
import 'widget/tab_selector.dart';

class VetAppointment extends StatefulWidget {
  const VetAppointment({super.key, required this.type});
  final AppointmentType type;

  @override
  State<VetAppointment> createState() => _VetAppointmentState();
}

class _VetAppointmentState extends State<VetAppointment>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<String> tabList = [
    "tab_current",
    "tab_upcoming",
    "tab_past",
    "tab_cancelled"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarWidget(
          type: widget.type,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.type == AppointmentType.typeToday
                ? const HeaderView()
                : TabSelector(
                    tabList: tabList,
                    currentIndex: _currentIndex,
                    onTapMenu: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                padding: EdgeInsets.only(
                  top: 15.sp,
                  bottom: 15.sp,
                ),
                itemBuilder: (_, index) {
                  return VetAppointmentListItem(
                    onViewDetail: () => Get.toNamed(
                      vetAppointmentDetail,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
