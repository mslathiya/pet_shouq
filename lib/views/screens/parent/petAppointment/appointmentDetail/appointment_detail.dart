import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/header_slider.dart';
import 'widgets/informative_text.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_details".tr,
        onPressBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 15.h,
              ),
              child: const HeaderSlider(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HB0053K05',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.sp, height: 2),
                  ),
                  const LabelWithIcon(
                    asset: AppAssets.icHospital,
                    value: 'Rimadyl',
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const LabelWithIcon(
                    asset: AppAssets.icPetPaw,
                    value: 'Max',
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 115.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icCalendar,
                          value: '04-Jan-2024',
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 170.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icClock,
                          value: '11:00 Am To 11:30 AM',
                          padding: EdgeInsets.zero,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InformativeText(
                    header: "disease".tr,
                    subHeader: "External parasites (ticks, fleas and mange)",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InformativeText(
                    header: "special_notes".tr,
                    subHeader:
                        "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, ",
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonView(
                      onTap: _dialogBuilder,
                      buttonTitle: "btn_reschedule_appointment".tr,
                      width: width - 20,
                      buttonStyle: TextStyle(
                        fontSize: 7.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        return const ReScheduleAppointment();
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
}
