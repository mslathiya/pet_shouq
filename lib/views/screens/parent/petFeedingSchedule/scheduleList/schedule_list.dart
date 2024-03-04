import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/pet_feeding_schedules_controller.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widget/feeding_shimmer_loding.dart';
import 'widget/sheet_menu_item.dart';

class FeedingSchedule extends StatefulWidget {
  const FeedingSchedule({super.key});

  @override
  State<FeedingSchedule> createState() => _FeedingScheduleState();
}

class _FeedingScheduleState extends State<FeedingSchedule> {
  PetFeedingSchedulesController petFeedingSchedulesController = Get.find();
  late String petId;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      petId = argumentData[0]['petId'];
      setState(() {
        petId;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      petFeedingSchedulesController.setScrollListener();
      petFeedingSchedulesController.getFeedingSchedulesData();
      petFeedingSchedulesController.petId = petId;
    });
    super.initState();
  }

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
        child: GetBuilder<PetFeedingSchedulesController>(
          builder: (controller) {
            if (controller.loadingFeedingData && controller.currentPage == 1) {
              return const FeedingScheduleListLoading();
            }
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Bottom List
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => controller.getFeedingSchedulesData(),
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: controller.controller,
                            itemCount: controller.petFeedingSchedulesArray.length + 1,
                            padding: EdgeInsets.only(
                              top: 10.sp,
                              bottom: 15.sp,
                            ),
                            itemBuilder: (_, index) {
                              if (index < controller.petFeedingSchedulesArray.length) {
                                final item = controller.petFeedingSchedulesArray[index];

                                return FeedScheduleListItem(
                                  info: item,
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
                                                  color: AppColors.fontMain
                                                      .withOpacity(0.13),
                                                  blurRadius: 5.sp,
                                                  offset: const Offset(0, 0),
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                              }
                              return Visibility(
                                child: controller.haveMoreResult
                                    ? const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : const SizedBox(),
                              );
                            },
                          ),
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
                if (controller.currentPage == 1 &&
                    controller.petFeedingSchedulesArray.isEmpty)
                  NoResultList(
                    header: "no_feeding_found".tr,
                    subHeader: "add_feeding_msg".tr,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
