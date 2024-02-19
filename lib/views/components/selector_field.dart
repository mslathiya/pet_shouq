import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/helpers.dart';
import '../../theme/theme.dart';

class SelectorField extends StatelessWidget {
  final Widget? headerWidget;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final String inputHint;
  final VoidCallback onSelectItem;
  final bool? documentUploader;
  final String? errorText;

  const SelectorField({
    super.key,
    this.headerWidget,
    this.suffixIcon,
    this.labelStyle,
    required this.inputHint,
    required this.onSelectItem,
    this.documentUploader = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        headerWidget != null ? headerWidget! : const SizedBox(),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onSelectItem,
          child: Container(
            padding: documentUploader == true
                ? EdgeInsets.zero
                : const EdgeInsets.all(
                    13,
                  ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
              ),
              border: Border.all(
                color: AppColors.inputBorder,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: documentUploader == false
                        ? EdgeInsets.zero
                        : const EdgeInsets.all(
                            13,
                          ),
                    child: Text(
                      inputHint,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            color: AppColors.hintColor,
                          )
                          .merge(labelStyle),
                    ),
                  ),
                ),
                Center(
                  child: suffixIcon ?? const SizedBox(),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null && CommonHelper.isNotEmpty(errorText))
          Padding(
            padding: EdgeInsets.only(
              left: 5.sp,
              top: 5.sp,
            ),
            child: Text(
              errorText ?? "",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: AppColors.redColor,
                  )
                  .merge(labelStyle),
            ),
          )
      ],
    );
  }
}
