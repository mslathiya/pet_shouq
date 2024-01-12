import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class EmergencyContactCard extends StatelessWidget {
  const EmergencyContactCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return ShadowBox(
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            t.translate("emergency_info"),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            t.translate("primary_doc"),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Dr. Smith at XYZ Animal Hospital\n(555) 123-4567",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 13.sp,
                  height: 1.7,
                  color: AppColors.gray,
                ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      t.translate("primary_hospital"),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 14.sp,
                              ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "ABC Emergency Vet Clinic\n(555) 123-4567",
                      textAlign: TextAlign.left,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 13.sp,
                                height: 1.7,
                                color: AppColors.gray,
                              ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  AppAssets.icInfo,
                  height: 52.h,
                  width: 42.w,
                  colorFilter: ColorFilter.mode(
                    AppColors.white.withOpacity(0.5),
                    BlendMode.srcATop,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
