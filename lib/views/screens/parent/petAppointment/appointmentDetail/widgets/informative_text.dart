import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';

class InformativeText extends StatelessWidget {
  const InformativeText({
    super.key,
    required this.header,
    required this.subHeader,
  });

  final String header;
  final String subHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 14.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          subHeader,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 14.sp,
                color: AppColors.hintColor,
              ),
        ),
      ],
    );
  }
}
