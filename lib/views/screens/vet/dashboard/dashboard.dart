import 'package:flutter/material.dart';

import '../../../../data/enum/enums.dart';
import '../../../../data/model/models.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import '../../screens.dart';
import '../vetAppointment/vet_appointment.dart';

class VetDashboard extends StatefulWidget {
  const VetDashboard({super.key});

  @override
  State<VetDashboard> createState() => _VetDashboardState();
}

class _VetDashboardState extends State<VetDashboard> {
  int currentIndex = 0;
  List<NavigationBarItem> items = [
    NavigationBarItem(title: "tab_home", icon: AppAssets.icTabOne),
    NavigationBarItem(title: 'availability', icon: AppAssets.icAvailability),
    NavigationBarItem(title: 'tab_appointment', icon: AppAssets.icTabTwo),
    NavigationBarItem(title: 'tab_profile', icon: AppAssets.icTabFour),
  ];

  /// Top Level Pages
  final List<Widget> topLevelPages = const [
    VetAppointment(
      type: AppointmentType.typeToday,
    ),
    VetAvailability(),
    VetAppointment(
      type: AppointmentType.typeAll,
    ),
    Profile(userType: UserType.typeVet),
  ];

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// on Page Changed
  void onPageChanged(int page) {
    currentIndex = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWrapperBody(),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SafeArea(
        child: AnimatedBottomBar(
          itemList: items,
          currentIndex: currentIndex,
          onTapMenu: (int value) {
            pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 10),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),
      ),
    );
  }

  // Body - MainWrapper Widget
  PageView _mainWrapperBody() {
    return PageView(
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: topLevelPages,
    );
  }
}
