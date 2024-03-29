import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../data/enum/enums.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class DoctorListItem extends StatelessWidget {
  final VoidCallback onViewDetail;
  final ViewType viewType;
  const DoctorListItem({
    super.key,
    required this.onViewDetail,
    required this.viewType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 10.sp,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rimadyl',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const LabelWithIcon(
                  asset: AppAssets.icDoctor,
                  value: 'Acute Kidney Disease',
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          viewType == ViewType.typeList
              ? Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: onViewDetail,
                    child: Container(
                      width: 35.w,
                      height: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.sp),
                        ),
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        Entypo.chevron_right,
                        size: 18.sp,
                        color: AppColors.fontMain,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
