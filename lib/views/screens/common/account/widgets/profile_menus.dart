import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../data/enum/enums.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ProfileMenus extends StatelessWidget {
  final Function(String) onTapMenu;
  const ProfileMenus(
      {super.key, required this.onTapMenu, required this.userType});
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 10.h,
          ),
          child: Text(
            "account".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ),
        userType == UserType.typeParent
            ? MenuItem(
                title: "screen_booking_history".tr,
                iconName: AppAssets.icBookingHistory,
                onPressMenu: () => onTapMenu(petAppointment),
              )
            : const SizedBox(),
        MenuItem(
          title: "screen_change_password".tr,
          iconName: AppAssets.icChangePassword,
          onPressMenu: () => onTapMenu(changePassword),
        ),
        MenuItem(
          title: "screen_notifications".tr,
          iconName: AppAssets.icNotification,
          onPressMenu: () => onTapMenu(notifications),
        ),
        MenuItem(
          title: "screen_privacy_policy".tr,
          iconName: AppAssets.icPrivacyPolicy,
          onPressMenu: () => onTapMenu(privacyPolicy),
        ),
        MenuItem(
          title: "screen_terms".tr,
          iconName: AppAssets.icTerms,
          onPressMenu: () => onTapMenu(termsCondition),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 10.h,
          ),
          child: Text(
            "help".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ),
        MenuItem(
          title: "screen_contact_us".tr,
          iconName: AppAssets.icContactUs,
          onPressMenu: () => onTapMenu(contactUs),
        ),
        MenuItem(
          title: "screen_faq".tr,
          iconName: AppAssets.icMostAsked,
          onPressMenu: () => onTapMenu(topAsked),
        ),
      ],
    );
  }
}
