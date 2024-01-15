import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../../data/enum/enums.dart';
import '../../../../components/components.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.type});

  final AppointmentType type;

  @override
  Widget build(BuildContext context) {
    var tr = ApplicationLocalizations.of(context)!;
    if (type == AppointmentType.typeAll) {
      return TabHeader(title: tr.translate("screen_appointments"));
    }
    return const MainHeader();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
