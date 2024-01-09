import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_menus.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    var t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: TabHeader(
        title: t.translate("tab_profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              ProfileInfo(
                onTapEdit: () => Navigator.pushNamed(
                  context,
                  editParentProfile,
                ),
              ),
              ProfileMenus(
                t: t,
                onTapMenu: (menuName) => Navigator.pushNamed(
                  context,
                  menuName,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: () => _dialogBuilderLogout(context, t),
                        buttonTitle: t.translate("btn_logout"),
                        width: width * .45,
                        buttonStyle: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: () => _dialogBuilderDeleteAccount(context, t),
                        buttonTitle: t.translate("btn_delete_account"),
                        width: width * .45,
                        buttonColor: AppColors.deleteButton,
                        buttonStyle: TextStyle(
                          color: AppColors.redColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Delete account
  Future<void> _dialogBuilderLogout(
      BuildContext context, ApplicationLocalizations t) {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.icLogout,
          label: t.translate("btn_logout"),
          subLabel: t.translate("message_logout"),
          buttonText: t.translate("btn_logout"),
          onPressButton: () {},
          secondaryButtonText: t.translate("btn_cancel"),
          onPressSecondaryButton: () {},
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  //Delete Account
  Future<void> _dialogBuilderDeleteAccount(
      BuildContext context, ApplicationLocalizations t) {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.icDeleteAccount,
          label: t.translate("account_deletion"),
          subLabel: t.translate("account_deletion_message"),
          buttonText: t.translate("btn_delete"),
          onPressButton: () {},
          secondaryButtonText: t.translate("btn_cancel"),
          onPressSecondaryButton: () {},
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
