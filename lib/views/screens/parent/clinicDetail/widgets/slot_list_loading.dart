import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/views/components/shimmer_layout.dart';


class SlotListLoading extends StatelessWidget {
  const SlotListLoading({
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
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 8,
          primary: false,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            mainAxisExtent: 42.sp,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 45.h,
              padding: EdgeInsets.all(4.sp),
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(18.sp),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:
                  Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
