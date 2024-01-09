import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/appointment_book_view.dart';
import 'widgets/header_slider.dart';
import 'widgets/informative_text.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_details"),
        onPressBack: () => Navigator.pop(context),
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
                        ?.copyWith(fontSize: 16.sp, height: 2),
                  ),
                  const LabelWithIcon(
                    asset: AppAssets.icHospital,
                    value: 'Rimadyl',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const LabelWithIcon(
                    asset: AppAssets.icPetPaw,
                    value: 'Max',
                  ),
                  SizedBox(
                    height: 3.h,
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
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SizedBox(
                        width: 170.sp,
                        child: const LabelWithIcon(
                          asset: AppAssets.icClock,
                          value: '11:00 Am To 11:30 AM',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InformativeText(
                    header: t.translate("disease"),
                    subHeader: "External parasites (ticks, fleas and mange)",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InformativeText(
                    header: t.translate("special_notes"),
                    subHeader:
                        "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, ",
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonView(
                      onTap: () => _dialogBuilder(context, t),
                      buttonTitle: t.translate("btn_reschedule_appointment"),
                      width: width - 20,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context, ApplicationLocalizations t) {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        double height = MediaQuery.of(context).size.height;
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {},
          child: Center(
            child: Container(
              height: height * .75,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: AppointmentBookView(
                t: t,
              ),
            ),
          ),
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
}
