import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithBack(
        withSearch: true,
        title: "screen_notifications".tr,
        onPressBack: () => Get.back(),
        showNotification: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 10.h,
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "mark_read".tr,
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.secondary,
                                ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Ionicons.checkmark_circle_outline,
                        size: 18.sp,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                padding: EdgeInsets.only(
                  bottom: 15.h,
                ),
                itemBuilder: (context, index) {
                  return NotificationListItem(
                    itemIndex: index,
                  );
                },
              ),
            ),
            Platform.isAndroid
                ? SizedBox(
                    height: 15.h,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
