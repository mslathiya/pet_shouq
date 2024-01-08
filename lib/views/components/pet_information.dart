import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class PetInformation extends StatelessWidget {
  const PetInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Antonetta Muller',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.icCalendar,
                height: 16.sp,
                width: 16.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Expanded(
                  child: Text(
                    '21-Dec-2023',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.icBreed,
                height: 16.sp,
                width: 16.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Expanded(
                  child: Text(
                    'German Shepherd',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineSmall,
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
