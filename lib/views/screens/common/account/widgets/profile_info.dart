import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import '../../../../../helper/helpers.dart';

class ProfileInfo extends StatelessWidget {
  final VoidCallback onTapEdit;
  const ProfileInfo({
    super.key,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final AuthController authController = Get.find();
    return Obx(() {
      UserBean userData = authController.userData.value;
      Parent? parentData = userData.parent;
      String primaryPhone =
          '${parentData?.parentContactCountryCode ?? ""} ${parentData?.parentContactNumber ?? ""}';

      String secondaryPhone =
          '${parentData?.parentSecondaryContactCountryCode ?? ""} ${parentData?.parentSecondaryContactNumber ?? ""}';
      String imagePath = "";
      bool haveImage = false;
      if (userData.profilePicture != null && userData.profilePicture != '') {
        imagePath = userData.fullProfileImageUrl.toString();
        haveImage = imagePath.hasValidUrl();
      }
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10.sp,
              right: 10.sp,
              bottom: 5.sp,
            ),
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              bottom: 10.h,
              top: 20.h,
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
            child: authController.gettingProfile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 36.sp,
                          width: 36.sp,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SizedBox(
                        height: 25,
                        width: width * 0.8,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 70.w,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              enabled: true,
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.sp,
                          ),
                          SizedBox(
                            height: 25,
                            width: 120.w,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              enabled: true,
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 25,
                        width: width * 0.6,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 25,
                        width: width * 0.7,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 25,
                        width: width * 0.45,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: EditButton(onPressEdit: onTapEdit),
                      ),
                      Text(
                        userData.userName ?? "",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 15.sp,
                                ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 70.w,
                            child: LabelWithIcon(
                              asset: AppAssets.icGender,
                              value: parentData?.parentSex ?? "",
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          SizedBox(
                            width: 8.sp,
                          ),
                          SizedBox(
                            width: 120.w,
                            child: LabelWithIcon(
                              asset: AppAssets.icBirthday,
                              value: parentData?.parentDob != null
                                  ? DateFormat("dd/MM/yyyy")
                                      .format(parentData!.parentDob!)
                                  : "-",
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      LabelWithIcon(
                        asset: AppAssets.icEmail,
                        value: userData.userEmail ?? "",
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      LabelWithIcon(
                        asset: AppAssets.icPhone,
                        value: "$primaryPhone / $secondaryPhone",
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      LabelWithIcon(
                        asset: AppAssets.icLocationPin,
                        value:
                            "${parentData?.parentAddress ?? ""} ${parentData?.parentAddressSecondLine ?? ""}",
                        padding: EdgeInsets.zero,
                      )
                    ],
                  ),
          ),
          Positioned.fill(
            top: -50,
            child: Align(
              alignment: Alignment.topCenter,
              child: haveImage
                  ? CachedNetworkImage(
                      imageUrl: imagePath,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 60),
                      fadeInCurve: Curves.easeIn,
                      height: 95.h,
                      width: 95.h,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 95.h,
                        width: 95.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                          95.h,
                          95.h,
                        ),
                      ),
                      child: Image.asset(
                        AppAssets.appLogoCircle,
                        height: 95.h,
                        width: 95.h,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ],
      );
    });
  }
}
