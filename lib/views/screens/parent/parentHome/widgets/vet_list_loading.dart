import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/theme/app.colors.dart';
import 'package:pet_shouq/views/components/list_placeholder.dart';
import 'package:pet_shouq/views/components/shimmer_layout.dart';


class VetListLoading extends StatelessWidget {
  const VetListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [1, 2, 3, 4, 5, 6,7 ]
              .map(
                (e) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                    vertical: 30.sp,
                  ),
                  margin: EdgeInsets.only(
                    left: 10.sp,
                    right: 10.sp,
                    bottom: 10.sp,
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
                ),
          )
              .toList(),
        ),
      ),
    );
  }
}
