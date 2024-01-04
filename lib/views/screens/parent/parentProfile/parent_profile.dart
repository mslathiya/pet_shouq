import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/config/config.dart';

import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              MenuItem(
                title: t.translate("screen_change_password"),
                iconName: AppAssets.icChangePassword,
                onPressMenu: () {},
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
                        fontSize: 16.sp,
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
          ),
        ),
      ),
    );
  }
}
