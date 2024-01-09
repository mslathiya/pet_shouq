import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../theme/theme.dart';
import 'pet_information.dart';

class MyPetItem extends StatelessWidget {
  final int itemIndex;
  final VoidCallback onDeletePet;
  final VoidCallback onViewPet;
  const MyPetItem({
    super.key,
    required this.itemIndex,
    required this.onDeletePet,
    required this.onViewPet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        bottom: 15.sp,
      ),
      child: Slidable(
        key: Key(itemIndex.toString()),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.3,
          children: [
            CustomSlidableAction(
              onPressed: (context) => onDeletePet,
              child: Container(
                width: 50.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  color: AppColors.deleteBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    AppAssets.icDelete,
                    height: 25.sp,
                    width: 25.sp,
                  ),
                ),
              ),
            )
          ],
        ),
        child: Container(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "pet$itemIndex",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    AppAssets.dog,
                    height: 70.h,
                    width: 67.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              const PetInformation(),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: InkWell(
                  onTap: onViewPet,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
