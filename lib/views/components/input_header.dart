import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputHeader extends StatelessWidget {
  final String? headerLabel;
  final bool compulsory;

  const InputHeader({
    super.key,
    this.headerLabel,
    this.compulsory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: headerLabel!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              WidgetSpan(
                child: SizedBox(width: 5.w),
              ),
              compulsory
                  ? TextSpan(
                      text: '*',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.red),
                    )
                  : WidgetSpan(
                      child: SizedBox(width: 5.w),
                    ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
