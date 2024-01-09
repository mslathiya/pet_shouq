import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../theme/theme.dart';
import 'label_with_icon.dart';

class MedicationListItem extends StatelessWidget {
  final VoidCallback onViewDetail;

  const MedicationListItem({
    super.key,
    required this.onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 10.w,
      ),
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rimadyl',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LabelWithIcon(
                      asset: AppAssets.icDoctor,
                      value: 'Dr. Roselyn F.',
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    LabelWithIcon(
                      asset: AppAssets.icPetPaw,
                      value: 'Whiskers',
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
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
                      color: AppColors.primary.withOpacity(0.4),
                    ),
                    child: Icon(
                      Entypo.chevron_right,
                      size: 18.sp,
                      color: AppColors.fontMain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: 80.w,
                child: LabelWithIcon(
                  asset: AppAssets.icDocBag,
                  value: 'Dog',
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 190.w,
                child: LabelWithIcon(
                  asset: AppAssets.icCalendar,
                  value: '2023-05-01 To 2023-05-14',
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
