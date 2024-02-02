import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

import '../../data/model/models.dart';
import '../../helper/helpers.dart';
import '../../theme/theme.dart';
import 'label_with_icon.dart';

class MyPetItem extends StatelessWidget {
  final int itemIndex;
  final VoidCallback onDeletePet;
  final VoidCallback onEditPet;
  final VoidCallback onViewPet;
  final PetItemBean itemBean;
  const MyPetItem({
    super.key,
    required this.itemIndex,
    required this.onDeletePet,
    required this.onEditPet,
    required this.onViewPet,
    required this.itemBean,
  });

  @override
  Widget build(BuildContext context) {
    bool haveImage = false;
    String imagePath = "";
    if (itemBean.petProfilePhoto != null) {
      imagePath = itemBean.fullProfileImageUrl.toString();
      haveImage = imagePath.hasValidUrl();
    }

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
          children: [
            CustomSlidableAction(
              onPressed: (context) => onDeletePet(),
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
            ),
            CustomSlidableAction(
              onPressed: (context) => onEditPet(),
              child: Container(
                width: 45.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  color: AppColors.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppAssets.editIcon,
                    height: 18.sp,
                    width: 18.sp,
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
                  borderRadius: BorderRadius.circular(10.sp),
                  child: !haveImage
                      ? Image.asset(
                          AppAssets.appLogo,
                          height: 70.w,
                          width: 70.w,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: imagePath,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 60),
                          fadeInCurve: Curves.easeIn,
                          height: 70.w,
                          width: 70.w,
                        ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemBean.petName ?? "",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.sp,
                              ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    LabelWithIcon(
                      asset: AppAssets.icCalendar,
                      value: itemBean.petDob != null
                          ? DateFormat("dd/MM/yyyy").format(itemBean.petDob!)
                          : "",
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    LabelWithIcon(
                      asset: AppAssets.icBreed,
                      value: itemBean.petBreed ?? "",
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
                  onTap: onViewPet,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
