import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../data/model/models.dart';
import '../../theme/theme.dart';

// ignore: must_be_immutable
class AnimatedBottomBar extends StatefulWidget {
  final List<NavigationBarItem> itemList;
  int currentIndex;
  final ValueChanged<int> onTapMenu;
  final ApplicationLocalizations localizations;
  AnimatedBottomBar({
    super.key,
    required this.itemList,
    this.currentIndex = 0,
    required this.onTapMenu,
    required this.localizations,
  });

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  double width = 0;

  List<NavigationBarItem> get items => widget.itemList;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            child: Row(
              children: items.map((e) {
                var index = items.indexOf(e);
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _select(index),
                  child: _buildItemWidget(e, index == widget.currentIndex),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  void _select(int index) {
    widget.currentIndex = index;
    widget.onTapMenu(widget.currentIndex);
    setState(() {});
  }

  Widget _buildIcon(String icon) {
    return SvgPicture.asset(
      icon,
      height: 36.sp,
      width: 36.sp,
      fit: BoxFit.contain,
    );
  }

  Widget _buildText(String label) {
    return Text(
      widget.localizations.translate(label),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            height: 2,
            fontSize: 12.sp,
            color: Colors.transparent,
            shadows: [
              Shadow(
                offset: const Offset(0, -8),
                color: AppColors.secondary,
              )
            ], // Step 3 SEE HERE
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: AppColors.secondary,
            decorationThickness: 2.sp,
          ),
    );
  }

  Widget _buildItemWidget(NavigationBarItem item, bool isSelected) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      width: width / items.length,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: isSelected ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 270),
            curve: Curves.linear,
            child: _buildIcon(item.icon),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 270),
            alignment: isSelected ? Alignment.center : const Alignment(0, 5.2),
            child: _buildText(item.title),
          ),
        ],
      ),
    );
  }
}
