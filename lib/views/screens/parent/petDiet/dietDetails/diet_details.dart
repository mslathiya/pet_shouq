import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/diet_info.dart';
import 'widgets/other_details.dart';

class DietDetails extends StatelessWidget {
  const DietDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_diet_log_details"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DietInfo(),
              ShadowBox(
                childWidget: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icClock,
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              t.translate("lbl_diet_time"),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "7:00 Am",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.icClockFaded,
                      height: 52.sp,
                      width: 52.sp,
                    ),
                  ],
                ),
              ),
              OtherDetails(t: t),
            ],
          ),
        ),
      ),
    );
  }
}
