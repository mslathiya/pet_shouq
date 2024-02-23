import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../controller/controllers.dart';
import '../../../../../helper/helpers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ListHistory extends StatefulWidget {
  const ListHistory({super.key});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<MedicalHistoryController>().setScrollListener();
      Get.find<MedicalHistoryController>().getHistoryList();
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
        title: "medical_history".tr,
        onPressBack: () => Get.back(),
      ),
      body: GetBuilder<MedicalHistoryController>(
        builder: (controller) {
          if (controller.loadingDietLog && controller.currentPage == 1) {
            return const ShimmerListLoading();
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => controller.getHistoryList(),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.controller,
                          itemCount: controller.historyLogArray.length + 1,
                          padding: EdgeInsets.only(
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          itemBuilder: (context, index) {
                            if (index < controller.historyLogArray.length) {
                              final item = controller.historyLogArray[index];
                              return HistoryListItem(
                                itemIndex: index,
                                onViewDetail: () async {
                                  final response = await controller
                                      .getHistoryDetails(item.mhId!);

                                  Get.toNamed(
                                    medicalHistoryDetails,
                                    arguments: [
                                      {"index": index},
                                      {"info": response}
                                    ],
                                  );
                                },
                                info: item,
                                onDeleteHistory: () {
                                  CommonHelper.dialogBuilderDeleteItem(
                                    title: "delete_item".tr,
                                    subTitle: "delete_item_msg".tr,
                                    onPressOkay: () {
                                      controller.deleteHistoryLog(item.mhId!);
                                    },
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
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: () => Get.toNamed(addMedicalHistory),
                        buttonTitle: "add_medical_history".tr,
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
              if (controller.removingHistory)
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
              if (controller.currentPage == 1 &&
                  controller.historyLogArray.isEmpty)
                NoResultList(
                  header: "no_history_found".tr,
                  subHeader: "add_history_msg".tr,
                ),
            ],
          );
        },
      ),
    );
  }
}
