import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'expandable_box.dart';

class FeedingDetail extends StatelessWidget {
  const FeedingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpandableBox(
          title: t.translate("morning_feeding"),
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: t.translate("time"),
                description: "1:00 Pm",
              ),
              Text(
                t.translate("example"),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: t.translate("afternoon_feeding"),
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: t.translate("time"),
                description: "6:00 Pm",
              ),
              Text(
                t.translate("example"),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: t.translate("evening_feeding"),
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: t.translate("time"),
                description: "6:00 Pm",
              ),
              Text(
                t.translate("example"),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: t.translate("bedtime_snack"),
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: t.translate("time"),
                description: "6:00 Pm",
              ),
              Text(
                t.translate("example"),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
