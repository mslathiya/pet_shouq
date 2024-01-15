import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../config/config.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class NutritionListItem extends StatelessWidget {
  final VoidCallback onViewDetail;
  final ApplicationLocalizations t;
  final int itemIndex;

  const NutritionListItem({
    super.key,
    required this.onViewDetail,
    required this.t,
    required this.itemIndex,
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
              onPressed: (context) => {},
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
            vertical: 10.sp,
            horizontal: 10.sp,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Premium Puppy Chow',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const LabelWithIcon(
                          asset: AppAssets.icBestProduct,
                          value: 'ABC Pet Foods',
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const LabelWithIcon(
                          asset: AppAssets.icBreedType,
                          value: 'Puppy',
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '\$1.50\n',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.secondary,
                              ),
                          children: [
                            TextSpan(
                              text: t.translate("per_pound"),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
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
                ],
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 70.sp,
                    child: const LabelWithIcon(
                      asset: AppAssets.icDocBag,
                      value: 'Dog',
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    width: 170.sp,
                    child: const LabelWithIcon(
                      asset: AppAssets.icFoodType,
                      value: 'Dry Kibble',
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
