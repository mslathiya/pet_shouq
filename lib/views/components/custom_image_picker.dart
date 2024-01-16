import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../theme/theme.dart';
import 'media_picker_view.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({
    super.key,
    required this.onPickImage,
    this.imagePath,
  });

  final Function(CroppedFile file, String type) onPickImage;
  final String? imagePath;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  bool isLocalImage(path) => Uri.tryParse(path)?.hasAbsolutePath ?? false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openImagePicker(context),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.elliptical(100.w, 100.w),
              color: AppColors.imagePickerContainer,
              dashPattern: const [4, 4],
              strokeCap: StrokeCap.butt,
              strokeWidth: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(100.w, 100.w),
                ),
                child: widget.imagePath != ''
                    ? isLocalImage(widget.imagePath)
                        ? Image.file(
                            File(widget.imagePath!),
                            height: 100.w,
                            width: 100.w,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(imageUrl: widget.imagePath!)
                    : Container(
                        height: 100.w,
                        width: 100.w,
                        color: AppColors.primary,
                      ),
              ),
            ),
            widget.imagePath == ''
                ? Positioned.fill(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: SvgPicture.asset(
                        AppAssets.camera,
                        height: 20.w,
                        width: 20.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.fontMain,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  void openImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => MediaPickerView(
        onPickImage: (file, type) {
          widget.onPickImage(file, type);
        },
      ),
    );
  }
}
