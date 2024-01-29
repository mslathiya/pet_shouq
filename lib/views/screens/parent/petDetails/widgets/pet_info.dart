import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({
    super.key,
    required this.info,
  });

  final PetInformation info;

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      childWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (info.petName ?? "").capitalize ?? "",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                LabelWithIcon(
                  asset: AppAssets.icCalendar,
                  value: info.petDob != null
                      ? DateFormat("dd/MM/yyyy").format(info.petDob!)
                      : "",
                  padding: EdgeInsets.zero,
                ),
                SizedBox(
                  height: 5.h,
                ),
                LabelWithIcon(
                  asset: AppAssets.icBreed,
                  value: info.petBreed ?? "",
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          EditButton(
            onPressEdit: () {},
          ),
        ],
      ),
    );
  }
}
