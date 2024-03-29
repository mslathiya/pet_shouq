import 'package:flutter/material.dart';

import '../../../../data/enum/enums.dart';
import '../../../../data/model/models.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import '../../screens.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  List<NavigationBarItem> items = [
    NavigationBarItem(title: "tab_home", icon: AppAssets.icTabOne),
    NavigationBarItem(title: 'tab_calendar', icon: AppAssets.icTabTwo),
    NavigationBarItem(title: 'tab_pets', icon: AppAssets.icTabThree),
    NavigationBarItem(title: 'tab_profile', icon: AppAssets.icTabFour),
  ];

  /// Top Level Pages
  final List<Widget> topLevelPages = const [
    ParentHome(),
    CalendarAppointment(),
    ParentMyPets(),
    Profile(userType: UserType.typeParent),
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
  void onPageChanged(int page) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWrapperBody(),
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
