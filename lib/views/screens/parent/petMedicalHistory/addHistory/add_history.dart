import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/controllers.dart';
import '../../../../components/components.dart';
import 'widgets/history_item.dart';
import 'widgets/pet_default_information.dart';

class AddHistory extends StatefulWidget {
  const AddHistory({super.key});

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  @override
  void initState() {
    Get.find<MedicalHistoryController>().initializeProcess();
    super.initState();
  }

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
      body: GetBuilder<MedicalHistoryController>(
        builder: (controller) => SingleChildScrollView(
          controller: controller.scrollController,
          physics: const ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const PetDefaultInformation(),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.historyList.length,
                  itemBuilder: (context, index) {
                    final item = controller.historyList[index];

                    bool showAddRecordButton =
                        index == controller.historyList.length - 1;

                    return HistoryItem(
                      itemIndex: index,
                      showAddButton: showAddRecordButton,
                      bean: item,
                      onSelectType: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.openRecordTypeSelector(index);
                      },
                      onAddNewRecord: () {
                        controller.addNewRecord();
                      },
                      onRemoveRecord: () {
                        controller.removeRecord(index);
                      },
                      onUpdateValue: (int itemIndex, int key, String value) {
                        controller.addValueToRecord(
                          index,
                          itemIndex,
                          key,
                          value,
                        );
                      },
                      onAddNewItem: (int itemIndex) {
                        controller.addItemRecord(index, itemIndex);
                      },
                      onRemoveItem: (int itemIndex) {
                        controller.removeItemRecord(index, itemIndex);
                      },
                    );
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
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.saveInformation();
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
    );
  }
}
