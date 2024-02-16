import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../../../controller/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class AddSpecialNote extends StatefulWidget {
  const AddSpecialNote({super.key});

  @override
  State<AddSpecialNote> createState() => _AddSpecialNoteState();
}

class _AddSpecialNoteState extends State<AddSpecialNote> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SpecialNoteController>().editFieldInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HeaderWithBack(
        title: "add_special_notes".tr,
        onPressBack: () => Get.back(),
      ),
      body: SafeArea(
        child: GetBuilder<SpecialNoteController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToolBar(
                  toolBarColor: AppColors.primary,
                  padding: const EdgeInsets.all(8),
                  iconSize: 25,
                  iconColor: AppColors.fontMain,
                  activeIconColor: AppColors.white,
                  controller: controller.controller,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                ),
                Expanded(
                  flex: 1,
                  child: QuillHtmlEditor(
                    hintText: 'Hint text goes here',
                    controller: controller.controller,
                    isEnabled: true,
                    minHeight: 300,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    hintTextStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.hintColor,
                            ),
                    hintTextAlign: TextAlign.start,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    hintTextPadding: EdgeInsets.zero,
                    backgroundColor: AppColors.backgroundLight,
                    onFocusChanged: (focus) {
                      debugPrint('has focus $focus');
                    },
                    onTextChanged: (text) =>
                        debugPrint('widget text change $text'),
                    onEditorCreated: () => debugPrint('Editor has been loaded'),
                    onEditingComplete: (s) =>
                        debugPrint('Editing completed $s'),
                    onEditorResized: (height) =>
                        debugPrint('Editor resized $height'),
                    onSelectionChanged: (sel) =>
                        debugPrint('${sel.index},${sel.length}'),
                    loadingBuilder: (context) {
                      return const Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 0.4,
                      ));
                    },
                  ),
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

                      controller.saveSpecialNotes();
                    },
                    buttonTitle: "btn_submit".tr,
                    width: width - 20,
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
