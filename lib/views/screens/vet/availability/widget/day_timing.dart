import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../theme/theme.dart';

class DisplayTiming extends StatelessWidget {
  const DisplayTiming({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 5.w,
              bottom: 8.h,
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5.w,
              runSpacing: 8.h,
              children: [
                Text(
                  '9:30 Am To 1:00 Pm,',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                ),
                Text(
                  '9:30 Am To 1:00 Pm,',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                ),
                Text(
                  '9:30 Am To 1:00 Pm,',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                ),
                Text(
                  '9:30 Am To 1:00 Pm,',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                ),
                Text(
                  '9:30 Am To 1:00 Pm,',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 40.sp,
            width: 40.sp,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.sp),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: SvgPicture.asset(
                AppAssets.icPencil,
                height: 26.sp,
                width: 26.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
