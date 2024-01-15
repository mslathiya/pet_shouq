import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/config.dart';
import '../../theme/theme.dart';

class MediaPickerView extends StatelessWidget {
  const MediaPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = ApplicationLocalizations.of(context)!;
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
                  locale.translate("camera"),
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
                  locale.translate("gallery"),
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
    Navigator.pop(context);
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  void openImageFromGallery(BuildContext context) async {
    Navigator.pop(context);
    await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
  }
}
