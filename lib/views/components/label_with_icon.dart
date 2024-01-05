import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LabelWithIcon extends StatelessWidget {
  final String asset;
  final String value;

  const LabelWithIcon({
    super.key,
    required this.asset,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 5.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        ],
      ),
    );
  }
}
