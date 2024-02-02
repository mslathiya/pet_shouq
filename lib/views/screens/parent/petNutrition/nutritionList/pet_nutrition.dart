import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class PetNutrition extends StatefulWidget {
  const PetNutrition({super.key});

  @override
  State<PetNutrition> createState() => _PetNutritionState();
}

class _PetNutritionState extends State<PetNutrition> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: HeaderWithBack(
        withSearch: true,
        title: "nutrition_feeding".tr,
        onPressBack: () => Navigator.pop(context),
      ),
      body: GetBuilder<NutritionController>(
        builder: (controller) {
          if (controller.loadingNutrition && controller.currentPage == 1) {
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
                        onRefresh: () => controller.getNutritionList(),
                        child: ListView.builder(
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
                                onDeleteItem: () => _dialogBuilderDeleteItem(
                                  () => controller.deleteNutrition(item.nutId!),
                                ),
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

  void _dialogBuilderDeleteItem(VoidCallback onPressOkay) {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomAlertDialog(
          topIcon: AppAssets.icDeleteAccount,
          label: "delete_item".tr,
          subLabel: "delete_item_msg".tr,
          buttonText: "btn_delete".tr,
          onPressButton: onPressOkay,
          secondaryButtonText: "btn_cancel".tr,
          onPressSecondaryButton: () {},
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
