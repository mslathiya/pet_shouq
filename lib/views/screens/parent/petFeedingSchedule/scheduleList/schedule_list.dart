import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widget/sheet_menu_item.dart';

class FeedingSchedule extends StatefulWidget {
  const FeedingSchedule({super.key});

  @override
  State<FeedingSchedule> createState() => _FeedingScheduleState();
}

class _FeedingScheduleState extends State<FeedingSchedule> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        withSearch: true,
        title: "screen_feeding_schedule".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Bottom List
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                padding: EdgeInsets.only(
                  top: 10.sp,
                  bottom: 15.sp,
                ),
                itemBuilder: (_, index) {
                  return FeedScheduleListItem(
                    itemIndex: index,
                    onToggleSwitch: (bool isToggled) {
                      if (isToggled) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: false,
                          useSafeArea: true,
                          enableDrag: false,
                          isDismissible: false,
                          constraints: BoxConstraints(
                            maxWidth: width * 0.95,
                          ),
                          backgroundColor: Colors.transparent,
                          builder: (context) => SafeArea(
                            child: Container(
                              height: 160.h,
                              width: width * 0.95,
                              margin: EdgeInsets.all(
                                10.sp,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.fontMain.withOpacity(0.13),
                                    blurRadius: 5.sp,
                                    offset: const Offset(0, 0),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SheetMenuItem(
                                    menuName: "btn_off_tomorrow".tr,
                                    onTapMenu: () => Get.back(),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: AppColors.inputBorder,
                                  ),
                                  SheetMenuItem(
                                    menuName: "btn_no_repeat".tr,
                                    onTapMenu: () => Get.back(),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: AppColors.inputBorder,
                                  ),
                                  SheetMenuItem(
                                    menuName: "btn_cancel".tr,
                                    onTapMenu: () => Get.back(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonView(
                onTap: () => Get.toNamed(petAddSchedule),
                buttonTitle: "screen_add_feed_schedule".tr,
                width: width - 20,
                buttonStyle: TextStyle(
                  fontSize: 9.sp,
                ),
                leftWidget: Padding(
                  padding: EdgeInsets.only(
                    right: 5.w,
                  ),
                  child: Icon(
                    Entypo.plus,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            !isNeedSafeArea
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
