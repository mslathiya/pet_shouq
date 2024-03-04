import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/controller/booking_history_controller.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';
import 'package:pet_shouq/data/model/booking_history_details_response_model.dart';
import 'package:pet_shouq/helper/time_formater.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/header_slider.dart';
import 'widgets/informative_text.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({super.key});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  late BookingHistoryDetailsData info;
  late int index;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      index = argumentData[0]['index'];
      info = argumentData[1]['info'];
      setState(() {
        info;
        index;
      });
      Get.find<BookingHistoryController>().petId = info.petId.toString();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "screen_details".tr,
        onPressBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 15.h,
              ),
              child: HeaderSlider(imageSource: info.vet!.fullClinicPhotoPath ?? ""),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${info.bookingId}',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.sp, height: 2),
                  ),
                  LabelWithIcon(
                    asset: AppAssets.icHospital,
                    value: '${info.vet!.vetFname}',
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  LabelWithIcon(
                    asset: AppAssets.icPetPaw,
                    value: '${info.pet!.petName}',
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 115.sp,
                        child: LabelWithIcon(
                          asset: AppAssets.icCalendar,
                          value: DateFormat('dd-MMM-yyyy').format(info.bookingDate!),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 170.sp,
                        child: LabelWithIcon(
                          asset: AppAssets.icClock,
                          value:
                              "${convertToAMPM(info.timeSlot.toString().split('to').first)} To ${convertToAMPM(info.timeSlot.toString().split('to').last)}",
                          padding: EdgeInsets.zero,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InformativeText(
                    header: "disease".tr,
                    subHeader: "${info.disease}",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InformativeText(
                      header: "special_notes".tr, subHeader: "${info.specialNotes}"),
                  SizedBox(
                    height: 15.h,
                  ),
                  GetBuilder<VetDataController>(
                    builder: (controller) {
                      return Align(
                        alignment: Alignment.center,
                        child: ButtonView(
                          onTap: () {
                            Get.find<BookingHistoryController>().setSelectedItems(
                                value: controller.vetDataList.first.vetFname.toString(),
                                vetIdValue: controller.vetDataList.first.veterinarianId
                                    .toString());
                            controller.selectionDate = "";
                            controller.selectionSlotTime = "";
                            _dialogBuilder();
                          },
                          buttonTitle: "btn_reschedule_appointment".tr,
                          width: width - 20,
                          buttonStyle: TextStyle(
                            fontSize: 7.sp,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _dialogBuilder() {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return ReScheduleAppointment();
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
