import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shouq/data/models.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class DietDetails extends StatelessWidget {
  const DietDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(
            10.sp,
          ),
          margin: EdgeInsets.all(
            10.sp,
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
              SvgPicture.asset(
                AppAssets.icCalendar,
                height: 30.sp,
                width: 30.sp,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "01-Jan-2024",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        ExpandableBox(
          title: "7:00 Am",
          infoList: [
            MedicalInfo(
              title: t.translate("food_type"),
              description: "Dry dog food (Brand X)",
            ),
            MedicalInfo(
              title: t.translate("portion_size"),
              description: "1.5 cups",
            ),
            MedicalInfo(
              title: t.translate("lbl_brand"),
              description: "Dry Kibble",
            ),
            MedicalInfo(
              title: t.translate("special_instruction"),
              description: "No special instructions",
            ),
            MedicalInfo(
              title: t.translate("lbl_water"),
              description: "Yes",
            ),
            MedicalInfo(
              title: t.translate("weight"),
              description: "45.2 pounds",
            )
          ],
        ),
      ],
    );
  }
}
