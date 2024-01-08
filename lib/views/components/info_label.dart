import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class InfoLabel extends StatelessWidget {
  final String title;
  final String description;
  final bool? allPadding;

  const InfoLabel({
    super.key,
    required this.title,
    required this.description,
    this.allPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding == true
          ? EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 5.h,
            )
          : EdgeInsets.symmetric(
              vertical: 5.h,
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 14.sp),
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      width: 5.w,
                    ),
                  ),
                  TextSpan(
                    text: ":",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            flex: 4,
            child: Text(
              description,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.hintColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
