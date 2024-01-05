import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/components.dart';

class TimeChart extends StatelessWidget {
  const TimeChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 10.sp,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
      ),
      child: const Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          TimeView(
            time: "7:00 Am",
            isActive: true,
          ),
          TimeView(
            time: "8:00 Pm",
            isActive: false,
          ),
          TimeView(
            time: "9:00 Pm",
            isActive: false,
          ),
          TimeView(
            time: "10:00 Pm",
            isActive: false,
          )
        ],
      ),
    );
  }
}
