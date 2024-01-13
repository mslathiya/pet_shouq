import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/theme.dart';

class SingleLabelItem extends StatelessWidget {
  const SingleLabelItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.asset,
  });

  final String title;
  final String subTitle;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        10.sp,
      ),
      margin: EdgeInsets.all(
        10.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.fontMain.withOpacity(0.13),
            blurRadius: 5.sp,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            asset,
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
                    title,
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
                    subTitle,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
