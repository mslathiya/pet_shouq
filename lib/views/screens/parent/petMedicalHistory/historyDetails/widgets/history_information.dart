import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class HistoryInformation extends StatelessWidget {
  const HistoryInformation({
    super.key,
    required this.bean,
    required this.userBean,
    required this.historyId,
  });
  final String historyId;
  final PetItemBean? bean;
  final UserBean? userBean;

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            bean?.petName ?? "",
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
          LabelWithIcon(
            asset: AppAssets.icPetPaw,
            value: bean?.petBreed ?? "",
            padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 8.h,
          ),
          LabelWithIcon(
            asset: AppAssets.icAppointmentCard,
            value: historyId,
            padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 8.h,
          ),
          LabelWithIcon(
            asset: AppAssets.icEmail,
            value: userBean?.userEmail ?? "",
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
