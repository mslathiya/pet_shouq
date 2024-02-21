import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddHistory extends StatefulWidget {
  const AddHistory({super.key});

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: Get.arguments != null && Get.arguments[0]['mode'] == "Edit"
            ? "update_medical_history".tr
            : "add_medical_history".tr,
        onPressBack: () => Get.back(),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: GetBuilder<MedicalHistoryController>(
                    builder: (controller) => Form(
                      key: controller.historyAddEditKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputField(
                            headerWidget: InputHeader(
                              compulsory: true,
                              headerLabel: "lbl_pet_name".tr,
                            ),
                            inputHint: "hint_pet_name".tr,
                          ),
                          SelectorField(
                            headerWidget: InputHeader(
                              headerLabel: "lbl_breed".tr,
                            ),
                            inputHint: "hint_breed".tr,
                            suffixIcon: SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: Icon(
                                Entypo.chevron_down,
                                size: 26.sp,
                                color: AppColors.hintColor,
                              ),
                            ),
                            onSelectItem: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              isLoading: controller.isLoading,
                              onTap: () {
                                if (controller.historyAddEditKey.currentState!
                                    .validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                              buttonTitle: "btn_save".tr,
                              width: width - 20,
                              buttonStyle: TextStyle(
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
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
    );
  }
}
