import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../components/components.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tr = ApplicationLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        // Slider
        const BannerSlider(),
        // Slider
        SizedBox(
          height: 10.h,
        ),
        Text(
          tr.translate('current_appointment'),
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 15.sp),
        ),
      ],
    );
  }
}
