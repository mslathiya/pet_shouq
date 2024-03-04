import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/booking_history_controller.dart';

import '../../../../../config/config.dart';
import '../../../../components/components.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BookingHistoryController>().setScrollListener();
      Get.find<BookingHistoryController>().getBookingHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        withSearch: true,
        title: "screen_appointment_booking".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: GetBuilder<BookingHistoryController>(
          builder: (controller) {
            if (controller.loadingHistory && controller.currentPage == 1) {
              return const ShimmerListLoading();
            }

            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: RefreshIndicator(
                    onRefresh: () => controller.getBookingHistory(),
                    child: ListView.builder(
                      itemCount: controller.bookingHistoryArray.length + 1,
                      controller: controller.controller,
                      padding: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 15.sp,
                      ),
                      itemBuilder: (_, index) {
                        if (index < controller.bookingHistoryArray.length) {
                          final item = controller.bookingHistoryArray[index];

                          return AppointmentListItem(
                            info: item,
                            onViewDetail: () async {
                              final response = await controller.getBookingHistoryDetails(
                                  bookingId: item.id.toString());

                              Get.toNamed(
                                petBookingDetails,
                                arguments: [
                                  {"index": index},
                                  {"info": response}
                                ],
                              );
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
                if (controller.loadingHistoryDetails)
                  const Positioned.fill(
                    child: SizedBox(
                      height: 76,
                      width: 76,
                      child: Center(
                        child: ShadowBox(
                          childWidget: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (controller.currentPage == 1 && controller.bookingHistoryArray.isEmpty)
                  NoResultList(
                    header: "no_booking_found".tr,
                    subHeader: "",
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
