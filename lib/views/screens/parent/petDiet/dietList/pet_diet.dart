import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../controller/controllers.dart';
import '../../../../../helper/helpers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetDiet extends StatefulWidget {
  const PetDiet({super.key});

  @override
  State<PetDiet> createState() => _PetDietState();
}

class _PetDietState extends State<PetDiet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DietLogController>().setScrollListener();
      Get.find<DietLogController>().getDietLogList();
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
        title: "screen_diet_log".tr,
        onPressBack: () => Get.back(),
      ),
      body: GetBuilder<DietLogController>(
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
                        onRefresh: () => controller.getDietLogList(),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.controller,
                          itemCount: controller.dietLogListArray.length + 1,
                          padding: EdgeInsets.only(
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          itemBuilder: (context, index) {
                            if (index < controller.dietLogListArray.length) {
                              final item = controller.dietLogListArray[index];
                              return DietListItem(
                                itemIndex: index,
                                onViewDetail: () async {
                                  final response = await controller
                                      .getDietDetail(item.dietId!);

                                  Get.toNamed(petDietDetail, arguments: [
                                    {"index": index},
                                    {"info": response}
                                  ]);
                                },
                                info: item,
                                onDeleteLog: () {
                                  CommonHelper.dialogBuilderDeleteItem(
                                    title: "delete_item".tr,
                                    subTitle: "delete_item_msg".tr,
                                    onPressOkay: () {
                                      controller.deleteDietLog(item.dietId!);
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
                        onTap: () => Get.toNamed(petAddDiet),
                        buttonTitle: "screen_add_diet_log".tr,
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
              if (controller.removingDietLog)
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
                  controller.dietLogListArray.isEmpty)
                NoResultList(
                  header: "no_diet_found".tr,
                  subHeader: "add_diet_msg".tr,
                ),
            ],
          );
        },
      ),
    );
  }
}
