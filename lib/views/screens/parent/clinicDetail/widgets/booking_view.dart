import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AppointmentBookingView extends StatelessWidget {
  const AppointmentBookingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            "btn_reschedule_appointment".tr,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SelectorField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: "lbl_dog_name".tr,
                              ),
                              inputHint: "hint_dog_name".tr,
                              suffixIcon: SizedBox(
                                width: 26.w,
                                height: 26.h,
                                child: Icon(
                                  Entypo.chevron_down,
                                  size: 26.sp,
                                  color: AppColors.hintColor,
                                ),
                              ),
                              onSelectItem: () {},
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: "disease".tr,
                              ),
                              inputHint: "hint_disease".tr,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: false,
                                headerLabel: "special_notes".tr,
                              ),
                              inputHint: "hint_special_note".tr,
                              isMultiline: true,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      onTap: () => Get.back(),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
