import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../data/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ProfileMenus extends StatelessWidget {
  final Function(String) onTapMenu;
  const ProfileMenus(
      {super.key, required this.onTapMenu, required this.userType});
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
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
                  fontSize: 16.sp,
                ),
          ),
        ),
        userType == UserType.typeParent
            ? MenuItem(
                title: t.translate("screen_booking_history"),
                iconName: AppAssets.icBookingHistory,
                onPressMenu: () => onTapMenu(petAppointment),
              )
            : const SizedBox(),
        MenuItem(
          title: t.translate("screen_change_password"),
          iconName: AppAssets.icChangePassword,
          onPressMenu: () => onTapMenu(changePassword),
        ),
        MenuItem(
          title: t.translate("screen_notifications"),
          iconName: AppAssets.icNotification,
          onPressMenu: () => onTapMenu(notifications),
        ),
        MenuItem(
          title: t.translate("screen_privacy_policy"),
          iconName: AppAssets.icPrivacyPolicy,
          onPressMenu: () => onTapMenu(privacyPolicy),
        ),
        MenuItem(
          title: t.translate("screen_terms"),
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
            t.translate("help"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ),
        MenuItem(
          title: t.translate("screen_contact_us"),
          iconName: AppAssets.icContactUs,
          onPressMenu: () => onTapMenu(contactUs),
        ),
        MenuItem(
          title: t.translate("screen_faq"),
          iconName: AppAssets.icMostAsked,
          onPressMenu: () => onTapMenu(topAsked),
        ),
      ],
    );
  }
}
