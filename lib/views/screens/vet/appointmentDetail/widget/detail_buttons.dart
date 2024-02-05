import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class DetailButtons extends StatelessWidget {
  const DetailButtons({super.key, required this.onScheduleAppointment});

  final VoidCallback onScheduleAppointment;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 10.sp,
          ),
          child: ButtonView(
            isBordered: true,
            onTap: onScheduleAppointment,
            buttonTitle: "btn_reschedule_appointment".tr,
            width: width - 20,
            buttonStyle: TextStyle(
              color: AppColors.secondary,
              fontSize: 7.sp,
            ),
            buttonColor: AppColors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 10.sp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () => {},
                  buttonTitle: "btn_reject".tr,
                  width: width * .45,
                  buttonStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 7.sp,
                  ),
                  buttonColor: AppColors.redColor,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () => {},
                  buttonTitle: "btn_accept".tr,
                  width: width * .45,
                  buttonStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 7.sp,
                  ),
                  buttonColor: AppColors.greenColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
