import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ProfileMenus extends StatelessWidget {
  final ApplicationLocalizations t;
  final Function(String) onTapMenu;
  const ProfileMenus({super.key, required this.t, required this.onTapMenu});

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
            t.translate("account"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 18.sp,
                ),
          ),
        ),
        MenuItem(
          title: t.translate("screen_booking_history"),
          iconName: AppAssets.icBookingHistory,
          onPressMenu: () => onTapMenu(petAppointment),
        ),
        MenuItem(
          title: t.translate("screen_change_password"),
          iconName: AppAssets.icChangePassword,
          onPressMenu: () => onTapMenu(changePassword),
        ),
        MenuItem(
          title: t.translate("screen_notifications"),
          iconName: AppAssets.icNotification,
          onPressMenu: () {},
        ),
        MenuItem(
          title: t.translate("screen_privacy_policy"),
          iconName: AppAssets.icPrivacyPolicy,
          onPressMenu: () {},
        ),
        MenuItem(
          title: t.translate("screen_terms"),
          iconName: AppAssets.icTerms,
          onPressMenu: () {},
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 10.h,
          ),
          child: Text(
            t.translate("help"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 18.sp,
                ),
          ),
        ),
        MenuItem(
          title: t.translate("screen_contact_us"),
          iconName: AppAssets.icContactUs,
          onPressMenu: () {},
        ),
        MenuItem(
          title: t.translate("screen_faq"),
          iconName: AppAssets.icMostAsked,
          onPressMenu: () {},
        ),
      ],
    );
  }
}
