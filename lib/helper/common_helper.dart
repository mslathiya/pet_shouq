import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';
import '../views/components/components.dart';

class CommonHelper {
  CommonHelper._();

  static void dialogBuilderDeleteItem({
    required String title,
    required String subTitle,
    required VoidCallback onPressOkay,
  }) {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.icDeleteAccount,
          label: title,
          subLabel: subTitle,
          buttonText: "btn_delete".tr,
          onPressButton: onPressOkay,
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
