import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

import '../../data/model/models.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class VaccinationListItem extends StatelessWidget {
  final VoidCallback onViewDetail;
  final VoidCallback onDeleteItem;
  final int itemIndex;
  final VaccinationBean itemBean;

  const VaccinationListItem({
    super.key,
    required this.onViewDetail,
    required this.itemIndex,
    required this.itemBean,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp,
      ),
      child: Slidable(
        key: Key(itemIndex.toString()),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.35,
          children: [
            CustomSlidableAction(
              onPressed: (context) => onDeleteItem(),
              child: Container(
                width: 45.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  color: AppColors.deleteBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppAssets.icDelete,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                ),
              ),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
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
                itemBean.vacName ?? "",
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
                          value: itemBean.vacProvider ?? "",
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        LabelWithIcon(
                          asset: AppAssets.icPetPaw,
                          value: itemBean.vacLotNumber ?? "",
                          padding: EdgeInsets.zero,
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
                          color: AppColors.primary,
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
              SizedBox(
                height: 5.h,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: const LabelWithIcon(
                      asset: AppAssets.icDocBag,
                      value: 'Dog',
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    width: 190.w,
                    child: LabelWithIcon(
                      asset: AppAssets.icCalendar,
                      value: DateFormat("yyyy-MM-dd")
                          .format(itemBean.vacDate ?? DateTime.now()),
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
