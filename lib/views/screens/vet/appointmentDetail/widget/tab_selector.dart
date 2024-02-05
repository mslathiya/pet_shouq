import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/components.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({
    super.key,
    required this.tabList,
    required this.currentIndex,
    required this.onTapMenu,
  });

  final List<String> tabList;
  final int currentIndex;
  final Function(int) onTapMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tabList.length,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = index == currentIndex;
          return TabItem(
            onTapMenu: () => onTapMenu(index),
            isSelected: isSelected,
            tabLabel: tabList[index].tr,
          );
        },
      ),
    );
  }
}
