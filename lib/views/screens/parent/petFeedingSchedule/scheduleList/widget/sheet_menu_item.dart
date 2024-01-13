import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetMenuItem extends StatelessWidget {
  const SheetMenuItem({
    super.key,
    required this.menuName,
    required this.onTapMenu,
  });
  final String menuName;
  final VoidCallback onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTapMenu,
        child: Text(
          menuName,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 15.sp, height: 2),
        ),
      ),
    );
  }
}
