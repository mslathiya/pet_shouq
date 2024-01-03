import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../data/models.dart';
import '../../../theme/theme.dart';
import '../../components/components.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({super.key});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  List<NavigationBarItem> items = [
    NavigationBarItem(title: "tab_home", icon: AppAssets.icTabOne),
    NavigationBarItem(title: 'tab_appointment', icon: AppAssets.icTabTwo),
    NavigationBarItem(title: 'tab_pets', icon: AppAssets.icTabThree),
    NavigationBarItem(title: 'tab_profile', icon: AppAssets.icTabFour),
  ];

  @override
  Widget build(BuildContext context) {
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Text(
          "Dashboard",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.2,
                letterSpacing: 0.20,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
        ),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        itemList: items,
        currentIndex: 2,
        onTapMenu: (int value) {
          print("Index $value");
        },
        localizations: t,
      ),
    );
  }
}

// ignore: must_be_immutable
