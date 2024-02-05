import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/enum/enums.dart';
import '../../../../components/components.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.type});

  final AppointmentType type;

  @override
  Widget build(BuildContext context) {
    if (type == AppointmentType.typeAll) {
      return TabHeader(title: "screen_appointments".tr);
    }
    return const MainHeader();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
