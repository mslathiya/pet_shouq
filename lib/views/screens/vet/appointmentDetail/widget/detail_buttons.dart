import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class DetailButtons extends StatelessWidget {
  const DetailButtons({super.key, required this.onScheduleAppointment});

  final VoidCallback onScheduleAppointment;

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
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
            buttonTitle: t.translate("btn_reschedule_appointment"),
            width: width - 20,
            buttonStyle: TextStyle(
              color: AppColors.secondary,
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
                  buttonTitle: t.translate("btn_reject"),
                  width: width * .45,
                  buttonStyle: TextStyle(
                    color: AppColors.white,
                  ),
                  buttonColor: AppColors.redColor,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () => {},
                  buttonTitle: t.translate("btn_accept"),
                  width: width * .45,
                  buttonStyle: TextStyle(
                    color: AppColors.white,
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
