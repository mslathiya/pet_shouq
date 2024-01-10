import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.onTapMenu,
    required this.isSelected,
    required this.tabLabel,
  });
  final VoidCallback onTapMenu;
  final bool isSelected;
  final String tabLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      child: GestureDetector(
        onTap: onTapMenu,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : AppColors.timeSelector,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.sp,
              ),
            ),
          ),
          child: Center(
            child: Text(
              tabLabel,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16.sp,
                    height: 2,
                    color: isSelected ? AppColors.white : AppColors.hintColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
