import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetDetail extends StatelessWidget {
  const PetDetail({
    super.key,
    required this.info,
  });

  final PetInformation info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icPetColor,
              title: (info.petColor ?? "").capitalizeFirst ?? "",
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icPetWeight,
              title: double.parse(info.petWeight.toString()) > 0
                  ? '${info.petWeight ?? ""} kg'
                  : "",
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 1,
            child: SpotInfo(
              icon: AppAssets.icPetHeight,
              title: double.parse(info.petHeight.toString()) > 0
                  ? '${info.petHeight ?? ""} cm'
                  : "",
            ),
          )
        ],
      ),
    );
  }
}
