import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../controller/controllers.dart';
import '../../../../data/enum/enums.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_menus.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.userType});

  final UserType userType;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    Get.find<AuthController>().getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: TabHeader(
        title: "tab_profile".tr,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
              ),
              ProfileInfo(
                onTapEdit: () {
                  if (widget.userType == UserType.typeParent) {
                    Get.toNamed(
                      editParentProfile,
                    );
                  } else {
                    Get.toNamed(
                      vetEditProfile,
                    );
                  }
                },
              ),
              widget.userType == UserType.typeVet
                  ? Column(
                      children: [
                        SingleLabelItem(
                          title: "specialization".tr,
                          subTitle: "Surgery, Dermatology, Nutrition",
                          asset: AppAssets.icDoctor,
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    )
                  : const SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              ProfileMenus(
                onTapMenu: (menuName) => Navigator.pushNamed(
                  context,
                  menuName,
                ),
                userType: widget.userType,
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
                        onTap: _dialogBuilderLogout,
                        buttonTitle: "btn_logout".tr,
                        width: width * .45,
                        buttonStyle: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: _dialogBuilderDeleteAccount,
                        buttonTitle: "btn_delete_account".tr,
                        width: width * .45,
                        buttonColor: AppColors.deleteButton,
                        buttonStyle: TextStyle(
                          color: AppColors.redColor,
                          fontSize: 8.sp,
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
  _dialogBuilderLogout() {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.icLogout,
          label: "btn_logout".tr,
          subLabel: "message_logout".tr,
          buttonText: "btn_logout".tr,
          onPressButton: () {
            Get.find<AuthController>().logoutCurrentUser();
          },
          secondaryButtonText: "btn_cancel".tr,
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
  _dialogBuilderDeleteAccount() {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.icDeleteAccount,
          label: "account_deletion".tr,
          subLabel: "account_deletion_message".tr,
          buttonText: "btn_delete".tr,
          onPressButton: () {
            Navigator.pushNamedAndRemoveUntil(context, intro, (_) => false);
          },
          secondaryButtonText: "btn_cancel".tr,
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
