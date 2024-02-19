import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../controller/controllers.dart';
import '../../../../../helper/helpers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetVaccination extends StatefulWidget {
  const PetVaccination({super.key});

  @override
  State<PetVaccination> createState() => _PetVaccinationState();
}

class _PetVaccinationState extends State<PetVaccination> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<VaccinationController>().setScrollListener();
      Get.find<VaccinationController>().getVaccinationList();
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
        title: "pet_vaccination".tr,
        onPressBack: () => Get.back(),
      ),
      body: GetBuilder<VaccinationController>(
        builder: (controller) {
          if (controller.loadingVaccination && controller.currentPage == 1) {
            return const ShimmerListLoading();
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => controller.getVaccinationList(),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.controller,
                          itemCount: controller.vaccinationListArray.length + 1,
                          padding: EdgeInsets.only(
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          itemBuilder: (context, index) {
                            if (index <
                                controller.vaccinationListArray.length) {
                              final item =
                                  controller.vaccinationListArray[index];
                              return VaccinationListItem(
                                itemIndex: index,
                                itemBean: item,
                                onViewDetail: () async {
                                  final response = await controller
                                      .getVaccinationDetails(item.vacId!);

                                  Get.toNamed(petVaccinationDetail, arguments: [
                                    {"index": index},
                                    {"info": response}
                                  ]);
                                },
                                onDeleteItem: () {
                                  CommonHelper.dialogBuilderDeleteItem(
                                    title: "delete_item".tr,
                                    subTitle: "delete_item_msg".tr,
                                    onPressOkay: () {
                                      controller.deleteVaccination(item.vacId!);
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
                        onTap: () => Get.toNamed(petAddVaccination),
                        buttonTitle: "btn_add_vaccination".tr,
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
              if (controller.removingVaccination)
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
                  controller.vaccinationListArray.isEmpty)
                NoResultList(
                  header: "no_vaccination_found".tr,
                  subHeader: "add_vaccination_msg".tr,
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.find<VaccinationController>().disposeController();
    super.dispose();
  }
}
