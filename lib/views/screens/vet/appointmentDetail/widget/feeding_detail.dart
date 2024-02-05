import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class FeedingDetail extends StatelessWidget {
  const FeedingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExpandableBox(
          title: "morning_feeding".tr,
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: "time".tr,
                description: "1:00 Pm",
              ),
              Text(
                "example".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: "afternoon_feeding".tr,
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: "time".tr,
                description: "6:00 Pm",
              ),
              Text(
                "example".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: "evening_feeding".tr,
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: "time".tr,
                description: "6:00 Pm",
              ),
              Text(
                "example".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: "bedtime_snack".tr,
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InfoLabel(
                allPadding: false,
                title: "time".tr,
                description: "6:00 Pm",
              ),
              Text(
                "example".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
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
