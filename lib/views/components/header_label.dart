import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderLabel extends StatelessWidget {
  final String header;
  final String subHeader;
  const HeaderLabel({super.key, required this.header, required this.subHeader});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          header,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                height: 1.2,
                letterSpacing: 0.20,
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          subHeader,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
