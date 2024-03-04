import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/controller/pet_controller.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';
import 'package:pet_shouq/data/model/vat_details_response_model.dart';

import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widgets/booking_view.dart';
import 'widgets/clinic_info.dart';
import 'widgets/header_slider.dart';
import 'widgets/slot_list_loading.dart';

class ClinicDetails extends StatefulWidget {
  const ClinicDetails({super.key});

  @override
  State<ClinicDetails> createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  late String veterinarianId;
  late VetDetailsData info;
  VetDataController vetDataController = Get.find();

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      veterinarianId = argumentData[0]['veterinarian_id'].toString();
      info = argumentData[1]['info'];
      setState(() {
        info;
        veterinarianId;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSlotDateData();
      Get.find<PetController>().getPetList();
      vetDataController.vetId = veterinarianId;
    });
    super.initState();
  }

  getSlotDateData() {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    vetDataController.setDateSelected(
        index: 0, selectedDate: todayDate, vetId: veterinarianId);
    vetDataController.setTimeSelected(index: "", selectedSlotTime: "", vatIdValue: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarHeader(info: info),
          SliverFillRemaining(
            child: DetailChildView(
              vatId: veterinarianId,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarHeader extends StatelessWidget {
  final VetDetailsData info;

  SliverAppBarHeader({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 300,
      leading: InkWell(
        onTap: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.sp,
            right: 12.sp,
          ),
          child: SvgPicture.asset(
            AppAssets.arrowLeft,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text(
        "screen_detail_page".tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              height: 2,
              letterSpacing: 0,
              color: AppColors.white,
            ),
      ),
      actions: [
        NotificationWidget(
          iconColor: AppColors.white,
        ),
        SizedBox(
          width: 15.w,
        ),
      ],
      automaticallyImplyLeading: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        background: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
              ),
            ),
            HeaderSlider(imagePath: info.fullClinicPhotoPath!),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: ClinicInfo(info: info),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailChildView extends StatelessWidget {
  final String vatId;

  DetailChildView({super.key, required this.vatId});

  DateTime now = DateTime.now();
  VetDataController vetDataController = Get.find();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    List<DateTime> next30Days = [];

    for (int i = 0; i < 30; i++) {
      next30Days.add(now.add(Duration(days: i)));
    }

    return GetBuilder<VetDataController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              InputHeader(
                headerLabel: "date".tr,
                compulsory: true,
                headerStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 55.sp,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: next30Days.length,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DateTime currentDate = next30Days[index];

                    // debugPrint("formattedDate --- $formattedDate");
                    return GestureDetector(
                      onTap: () {
                        controller.setDateSelected(
                            vetId: vatId,
                            index: index,
                            selectedDate: DateFormat('yyyy-MM-dd').format(currentDate));
                      },
                      child: DateItem(
                        index: index,
                        isSelected: vetDataController.selectedDateIndex == index,
                        date: DateFormat('EEE').format(currentDate),
                        day: DateFormat('dd').format(currentDate),
                        // isSelected: false,
                        isDisabled: false,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              InputHeader(
                headerLabel: "time".tr,
                compulsory: true,
                headerStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
              SizedBox(
                height: 5.h,
              ),
              if (controller.loadingGetSlot)
                const SlotListLoading()
              else if (controller.slotDataList.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No Slot Available'),
                    ],
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.slotDataList.length,
                  primary: false,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 42.sp,
                  ),
                  itemBuilder: (context, index) {
                    DateTime parsedStartTime = DateFormat('HH:mm:ss')
                        .parse(controller.slotDataList[index].vaStartTime.toString());
                    DateTime parsedEndTime = DateFormat('HH:mm:ss')
                        .parse(controller.slotDataList[index].vaEndTime.toString());
                    String formattedStartTime =
                        DateFormat('hh:mm a').format(parsedStartTime);
                    String formattedEndTime = DateFormat('hh:mm a').format(parsedEndTime);
                    return GestureDetector(
                      onTap: () {
                        if (controller.slotDataList[index].isAvailable!) {
                          controller.setTimeSelected(
                              index: index.toString(),
                              vatIdValue: controller.slotDataList[index].vaId.toString(),
                              selectedSlotTime:
                                  "${controller.slotDataList[index].vaStartTime} to ${controller.slotDataList[index].vaEndTime}");
                        }
                      },
                      child: TimeItem(
                        isSelected: controller.selectedSlotIndex == index.toString(),
                        time: "$formattedStartTime To $formattedEndTime",
                        isDisabled: controller.slotDataList[index].isAvailable == true
                            ? false
                            : true,
                      ),
                    );
                  },
                ),
              SizedBox(
                height: 15.h,
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () {
                    debugPrint("selectedDate --- ${controller.selectionDate}");
                    debugPrint("selectedTime --- ${controller.selectionSlotTime}");

                    if (controller.selectionDate.isEmpty) {
                      Get.snackbar(
                        "error_in_request".tr,
                        'Please select Slot Date',
                        backgroundColor: AppColors.redColor,
                        colorText: AppColors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (controller.selectionSlotTime.isEmpty) {
                      Get.snackbar(
                        "error_in_request".tr,
                        'Please select Slot Time',
                        backgroundColor: AppColors.redColor,
                        colorText: AppColors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      controller.setSelectedItems(
                          value: Get.find<PetController>()
                              .petListArray
                              .first
                              .petName
                              .toString(),
                          petIdValue: Get.find<PetController>()
                              .petListArray
                              .first
                              .petId
                              .toString());
                      controller.resetFields();

                      _dialogBuilder();
                    }
                  },
                  buttonTitle: "btn_book_now".tr,
                  width: width - 40,
                  buttonStyle: TextStyle(
                    fontSize: 7.sp,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _dialogBuilder() {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        double height = MediaQuery.of(Get.context!).size.height;
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {},
          child: Center(
            child: Container(
              height: height * .6,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const AppointmentBookingView(),
            ),
          ),
        );
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
