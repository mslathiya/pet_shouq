import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class MedicalSpecification extends StatelessWidget {
  const MedicalSpecification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SpotInfo(
              boxColor: AppColors.lightBrown,
              icon: AppAssets.icCake,
              title: '3 Years',
              textStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 1,
            child: SpotInfo(
              boxColor: AppColors.lightBrown,
              icon: AppAssets.icGenderType,
              title: 'Female',
              textStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 1,
            child: SpotInfo(
              boxColor: AppColors.lightBrown,
              icon: AppAssets.icPetWeight,
              title: '70 Pounds',
              textStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
