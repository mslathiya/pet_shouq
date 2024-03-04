import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/pet_controller.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AppointmentBookingView extends StatefulWidget {
  const AppointmentBookingView({
    super.key,
  });

  @override
  State<AppointmentBookingView> createState() => _AppointmentBookingViewState();
}

class _AppointmentBookingViewState extends State<AppointmentBookingView> {
  PetController petController = Get.find();
  VetDataController vetDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<VetDataController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width,
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(10.sp),
                ),
              ),
              child: Text(
                // "btn_reschedule_appointment".tr,
                "btn_book_nowF".tr,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.sp,
                      height: 2,
                      color: AppColors.white,
                    ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: IntrinsicHeight(
                      child: Material(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              top: 15.h,
                            ),
                            child: Form(
                              key: controller.bookingKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.zero,
                                      child: Text(
                                        "lbl_dog_name".tr,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      )),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp),
                                      ),
                                      border: Border.all(
                                        color: AppColors.inputBorder,
                                        width: 1,
                                      ),
                                    ),
                                    child: DropdownButton<String>(
                                      hint: Text(
                                        "hint_dog_name".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.hintColor,
                                            ),
                                      ),
                                      value: controller.selectedDogName,
                                      underline: const SizedBox(),
                                      icon: Icon(
                                        Entypo.chevron_down,
                                        size: 26.sp,
                                        color: AppColors.hintColor,
                                      ),
                                      onChanged: (String? newValue) {
                                        controller.setSelectedItems(
                                            value: newValue!,
                                            petIdValue: petController.petListArray
                                                .where((element) =>
                                                    element.petName == newValue)
                                                .toList()
                                                .first
                                                .petId
                                                .toString());
                                      },
                                      isExpanded: true,
                                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                                      items: petController.petListArray
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.petName,
                                          child: Text(value.petName!,
                                              style:
                                                  Theme.of(context).textTheme.bodyMedium),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  InputField(
                                    editingController: controller.diseaseTextController,
                                    headerWidget: InputHeader(
                                      compulsory: true,
                                      headerLabel: "disease".tr,
                                    ),
                                    inputHint: "hint_disease".tr,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "dynamic_field_required".trParams(
                                            {"field": "disease".tr},
                                          ),
                                        ),
                                      ],
                                    ).call,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  InputField(
                                    editingController: controller.specialNotesController,
                                    headerWidget: InputHeader(
                                      compulsory: false,
                                      headerLabel: "special_notes".tr,
                                    ),
                                    inputHint: "hint_special_note".tr,
                                    isMultiline: true,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "dynamic_field_required".trParams(
                                            {"field": "special_notes".tr},
                                          ),
                                        ),
                                      ],
                                    ).call,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.sp,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: ButtonView(
                                            onTap: () => Get.back(),
                                            buttonTitle: "btn_cancel".tr,
                                            width: width * .43,
                                            buttonStyle: TextStyle(
                                              color: AppColors.hintColor,
                                              fontSize: 7.sp,
                                            ),
                                            buttonColor: AppColors.inputBorder,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: ButtonView(
                                            onTap: () {
                                              if (controller.bookingKey.currentState!
                                                  .validate()) {
                                                FocusManager.instance.primaryFocus!
                                                    .unfocus();
                                                Get.back();
                                                controller.bookVetSlot();
                                              }
                                            },
                                            buttonTitle: "btn_confirm_booking".tr,
                                            width: width * .43,
                                            buttonStyle: TextStyle(
                                              fontSize: 7.sp,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
