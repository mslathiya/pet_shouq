import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ListHistory extends StatefulWidget {
  const ListHistory({super.key});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
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
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(),
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
            ],
          );
        },
      ),
    );
  }
}
