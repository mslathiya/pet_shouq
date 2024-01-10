import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class VaccinationDetails extends StatelessWidget {
  const VaccinationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 10.sp,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            t.translate("pet_vaccination_detail"),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 16.sp, height: 1.5),
          ),
          SizedBox(
            height: 5.h,
          ),
          InfoLabel(
            title: t.translate("lbl_species"),
            description: 'Dog',
          ),
          InfoLabel(
            title: t.translate("vaccination_name"),
            description: 'Rabies',
          ),
          InfoLabel(
            title: t.translate("vaccination_type"),
            description: 'Core',
          ),
          InfoLabel(
            title: t.translate("vaccination_date"),
            description: '01-Jan-2024',
          ),
          InfoLabel(
            title: t.translate("next_due_date"),
            description: '01-Jan-2024',
          ),
          InfoLabel(
            title: t.translate("next_due_date"),
            description: '01-Jan-2024',
          ),
          InfoLabel(
            title: t.translate("vaccination_provider"),
            description: 'ABC Animal Clinic',
          ),
          InfoLabel(
            title: t.translate("vaccination_lot_no"),
            description: '12345',
          ),
          InfoLabel(
            title: t.translate("vaccination_id"),
            description: 'VC-2022-12345',
          ),
        ],
      ),
    );
  }
}
