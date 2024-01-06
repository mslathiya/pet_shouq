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
        vertical: 5.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            asset,
            height: 18.sp,
            width: 18.sp,
          ),
          SizedBox(
            width: 8.sp,
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.headlineSmall?.merge(textStyle),
            ),
          )
        ],
      ),
    );
  }
}
