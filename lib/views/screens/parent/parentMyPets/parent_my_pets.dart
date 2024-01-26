import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../controller/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class ParentMyPets extends StatefulWidget {
  const ParentMyPets({super.key});

  @override
  State<ParentMyPets> createState() => _ParentMyPetsState();
}

class _ParentMyPetsState extends State<ParentMyPets> {
  @override
  void initState() {
    Get.find<PetController>().setScrollListener();
    Get.find<PetController>().getPetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return Scaffold(
      appBar: TabHeader(
        title: "tab_pets".tr,
      ),
      body: GetBuilder<PetController>(
        builder: (controller) {
          if (controller.loadingPetList && controller.currentPage == 1) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                      .map(
                        (e) => SizedBox(
                          height: 75.h,
                          width: double.infinity,
                          child: const ContentPlaceholder(
                            lineType: ContentLineType.threeLines,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: controller.controller,
                        itemCount: controller.petListArray.length + 1,
                        padding: EdgeInsets.only(
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        itemBuilder: (context, index) {
                          if (index < controller.petListArray.length) {
                            final item = controller.petListArray[index];
                            return MyPetItem(
                              itemBean: item,
                              itemIndex: index,
                              onDeletePet: () => _dialogBuilderDeleteItem(
                                () => controller.deletePet(item.petId!),
                              ),
                              onViewPet: () =>
                                  Navigator.pushNamed(context, petDetails),
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
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: () => Get.toNamed(addPet),
                        buttonTitle: "btn_add_pet".tr,
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
              if (controller.removingPet)
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
                  controller.petListArray.isEmpty)
                Positioned.fill(
                  child: SizedBox(
                    height: 76,
                    width: 76,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.noResult,
                              height: 260.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "no_pet_found".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 26.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "add_pet_msg".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 16.sp,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
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
