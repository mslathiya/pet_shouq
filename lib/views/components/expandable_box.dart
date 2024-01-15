import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/models.dart';
import '../../theme/theme.dart';
import 'info_label.dart';
import 'shadow_box.dart';

class ExpandableBox extends StatelessWidget {
  const ExpandableBox({
    super.key,
    required this.infoList,
    required this.title,
    this.customWidget,
    this.initiallyExpanded,
  });
  final List<MedicalInfo> infoList;
  final String title;
  final Widget? customWidget;
  final bool? initiallyExpanded;

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
          initiallyExpanded: initiallyExpanded ?? false,
          collapsedShape: const Border(),
          shape: const Border(),
          iconColor: AppColors.fontMain,
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          expandedAlignment: Alignment.topLeft,
          children: customWidget != null
              ? [customWidget!]
              : infoList
                  .map(
                    (e) => InfoLabel(
                      title: e.title,
                      description: e.description,
                      padding: EdgeInsets.only(bottom: 5.h),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
