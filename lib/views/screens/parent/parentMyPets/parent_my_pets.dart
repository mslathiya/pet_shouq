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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PetController>().setScrollListener();
      Get.find<PetController>().getPetList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return Scaffold(
      appBar: TabHeader(
        withSearch: true,
        title: "tab_pets".tr,
      ),
      body: GetBuilder<PetController>(
        builder: (controller) {
          if (controller.loadingPetList && controller.currentPage == 1) {
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
                        onRefresh: () => controller.resetRequest(),
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
                                onViewPet: () async {
                                  final response = await controller
                                      .getPetDetails(item.petId!);

                                  Get.toNamed(petDetails, arguments: [
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
                        onTap: () => Get.toNamed(addPet),
                        buttonTitle: "btn_add_pet".tr,
                        width: width - 20,
                        buttonStyle: TextStyle(
                          fontSize: 9.sp,
                        ),
                        leftWidget: Padding(
                          padding: EdgeInsets.only(
                            right: 2.w,
                          ),
                          child: Icon(
                            Entypo.plus,
                            size: 12.sp,
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
                NoResultList(
                  header: "no_pet_found".tr,
                  subHeader: "add_pet_msg".tr,
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
