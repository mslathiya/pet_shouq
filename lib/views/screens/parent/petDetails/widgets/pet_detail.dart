import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

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
          SizedBox(
            width: 8.w,
          ),
          const Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icPetWeight,
              title: '11.00 Kg',
            ),
          ),
          SizedBox(
            width: 8.w,
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
