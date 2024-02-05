import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/theme.dart';

class MediaPickerView extends StatelessWidget {
  const MediaPickerView({super.key, required this.onPickImage});
  final Function(CroppedFile file, String type) onPickImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 15.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => openImageFromCamera(context),
                  icon: Icon(
                    MaterialIcons.camera,
                    size: 46.sp,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "camera".tr,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
            ),
            child: VerticalDivider(color: AppColors.grayFaded),
          ),
          SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => openImageFromGallery(context),
                  icon: Icon(
                    MaterialIcons.add_photo_alternate,
                    size: 46.sp,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "gallery".tr,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openImageFromCamera(BuildContext context) async {
    Get.back();
    var response = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (response != null) {
      var file = await cropSelectedImage(response);
      if (file != null) {
        onPickImage(file, "Camera");
      }
    }
  }

  void openImageFromGallery(BuildContext context) async {
    Get.back();
    var response = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (response != null) {
      var file = await cropSelectedImage(response);
      if (file != null) {
        onPickImage(file, "Gallery");
      }
    }
  }

  Future<CroppedFile?> cropSelectedImage(XFile file) async {
    return await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: AppColors.secondary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
      cropStyle: CropStyle.circle,
      compressQuality: 95,
    );
  }
}
