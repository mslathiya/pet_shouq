import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/models.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.bean,
    required this.onSelectType,
    required this.onAddNewRecord,
    required this.itemIndex,
    required this.showAddButton,
    required this.onRemoveRecord,
    required this.onUpdateValue,
    required this.onAddNewItem,
    required this.onRemoveItem,
  });
  final int itemIndex;
  final bool showAddButton;
  final HistoryRequestBean bean;
  final VoidCallback onSelectType;
  final VoidCallback onAddNewRecord;
  final VoidCallback onRemoveRecord;
  final Function(int itemIndex, int key, String value) onUpdateValue;
  final Function(int itemIndex) onAddNewItem;
  final Function(int itemIndex) onRemoveItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SelectorField(
                  headerWidget: InputHeader(
                    headerLabel: "lbl_record_type".tr,
                  ),
                  inputHint: bean.recordType?.name ?? "hint_select_type".tr,
                  suffixIcon: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Icon(
                      Entypo.chevron_down,
                      size: 26.sp,
                      color: AppColors.hintColor,
                    ),
                  ),
                  onSelectItem: onSelectType,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: showAddButton
                    ? GestureDetector(
                        onTap: onAddNewRecord,
                        child: Container(
                          height: 45.sp,
                          width: 32.sp,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                          ),
                          child: Icon(
                            Entypo.plus,
                            color: AppColors.secondary,
                            size: 20.sp,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: onRemoveRecord,
                        child: Container(
                          height: 45.sp,
                          width: 32.sp,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                          ),
                          child: Icon(
                            Entypo.minus,
                            color: AppColors.secondary,
                            size: 20.sp,
                          ),
                        ),
                      ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: bean.listArray.length,
            itemBuilder: (context, index) {
              bool showAddRecordButton = index == bean.listArray.length - 1;

              return Container(
                margin: EdgeInsets.only(
                  top: 8.h,
                  bottom: 8.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: InputField(
                        maxLength: 100,
                        headerWidget: InputHeader(
                          headerLabel: "lbl_name".tr,
                        ),
                        inputHint: "hint_name".tr,
                        onValueChange: (value) {
                          onUpdateValue(index, 1, value);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: InputField(
                        maxLength: 100,
                        headerWidget: InputHeader(
                          headerLabel: "lbl_value".tr,
                        ),
                        inputHint: "hint_value".tr,
                        onValueChange: (value) {
                          onUpdateValue(index, 2, value);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: showAddRecordButton
                          ? GestureDetector(
                              onTap: () => onAddNewItem(index),
                              child: Container(
                                height: 45.sp,
                                width: 32.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.sp),
                                  ),
                                ),
                                child: Icon(
                                  Entypo.plus,
                                  color: AppColors.secondary,
                                  size: 20.sp,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => onRemoveItem(index),
                              child: Container(
                                height: 45.sp,
                                width: 32.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.sp),
                                  ),
                                ),
                                child: Icon(
                                  Entypo.minus,
                                  color: AppColors.secondary,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
