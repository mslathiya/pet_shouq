import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/views/components/components.dart';

import '../../theme/theme.dart';

class TopAskedItem extends StatelessWidget {
  const TopAskedItem({
    super.key,
    required this.itemIndex,
  });
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      isExpanded: true,
      childWidget: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0.0,
        horizontalTitleGap: 0,
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(vertical: 4.sp),
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: false,
          collapsedShape: const Border(),
          shape: const Border(),
          iconColor: AppColors.fontMain,
          title: Text(
            "Many desktop publishing",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          children: [
            Text(
              "Mauris ut erat ut urna rhoncus facilisis a eu neque. Ut iaculis viverra laoreet. In interdum, augue non auctor pharetra, felis ante gravida ante, quis mattis quam eros non quam. Vivamus scelerisque ante nec dapibus convallis. Vestibulum quis scelerisque leo.",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.hintColor,
                    fontSize: 12.sp,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
