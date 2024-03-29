import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../controller/controllers.dart';
import '../../../../../helper/helpers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetNutrition extends StatefulWidget {
  const PetNutrition({super.key});

  @override
  State<PetNutrition> createState() => _PetNutritionState();
}

class _PetNutritionState extends State<PetNutrition> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<NutritionController>().setScrollListener();
      Get.find<NutritionController>().getNutritionList();
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
        title: "nutrition_feeding".tr,
        onPressBack: () => Get.back(),
      ),
      body: GetBuilder<NutritionController>(
        builder: (controller) {
          if (controller.loadingNutrition && controller.currentPage == 1) {
            return const ShimmerListLoading();
          }
          return Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => controller.getNutritionList(),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.controller,
                          itemCount: controller.nutritionListArray.length + 1,
                          padding: EdgeInsets.only(
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          itemBuilder: (context, index) {
                            if (index < controller.nutritionListArray.length) {
                              final item = controller.nutritionListArray[index];
                              return NutritionListItem(
                                itemBean: item,
                                itemIndex: index,
                                onDeleteItem: () {
                                  CommonHelper.dialogBuilderDeleteItem(
                                    title: "delete_item".tr,
                                    subTitle: "delete_item_msg".tr,
                                    onPressOkay: () {
                                      controller.deleteNutrition(item.nutId!);
                                    },
                                  );
                                },
                                onViewDetail: () async {
                                  final response = await controller
                                      .getNutritionDetail(item.nutId!);

                                  Get.toNamed(petNutritionDetail, arguments: [
                                    {"index": index},
                                    {"info": response}
                                  ]);
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
                        onTap: () => Get.toNamed(petAddNutrition),
                        buttonTitle: "screen_nutrition_feeding".tr,
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
              if (controller.removingNutrition)
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
                  controller.nutritionListArray.isEmpty)
                NoResultList(
                  header: "no_nutrition_found".tr,
                  subHeader: "add_nutrition_msg".tr,
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.find<NutritionController>().disposeController();
    super.dispose();
  }
}
