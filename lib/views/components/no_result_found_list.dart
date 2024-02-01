import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class NoResultList extends StatelessWidget {
  const NoResultList({
    super.key,
    required this.header,
    this.subHeader,
    this.imageAsset,
  });
  final String header;
  final String? subHeader;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SizedBox(
        height: 76,
        width: 76,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageAsset ?? AppAssets.noResult,
                  height: 260.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Text(
                  header,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 23.sp,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                if (subHeader != null)
                  Text(
                    subHeader ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14.sp,
                        ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
