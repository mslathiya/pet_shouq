import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import 'pet_spot_info.dart';

class PetDetail extends StatelessWidget {
  const PetDetail({
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
          const Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icPetColor,
              title: 'Brown',
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SpotInfo(
                icon: AppAssets.icPetWeight,
                title: '11.00 Kg',
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icPetHeight,
              title: '41.00',
            ),
          )
        ],
      ),
    );
  }
}
