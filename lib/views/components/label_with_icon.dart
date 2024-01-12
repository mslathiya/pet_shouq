import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LabelWithIcon extends StatelessWidget {
  final String asset;
  final String value;
  final TextStyle? textStyle;
  const LabelWithIcon({
    super.key,
    required this.asset,
    required this.value,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 3.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.sp,
            width: 16.sp,
            child: SvgPicture.asset(
              asset,
              height: 16.sp,
              width: 16.sp,
            ),
          ),
          SizedBox(
            width: 6.sp,
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                    fontSize: 12.sp,
                  )
                  .merge(textStyle),
            ),
          )
        ],
      ),
    );
  }
}
