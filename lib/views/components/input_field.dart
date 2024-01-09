import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class InputField extends StatelessWidget {
  final bool compulsory;
  final TextEditingController? editingController;
  final TextInputType? keyboardType;
  final String inputHint;
  final FormFieldValidator<String>? validator;
  final ValueChanged? onValueChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enableInput;
  final int? maxLength;
  final Widget? headerWidget;
  final bool isMultiline;

  const InputField({
    super.key,
    this.compulsory = false,
    this.editingController,
    this.keyboardType = TextInputType.text,
    this.maxLength = 50,
    required this.inputHint,
    this.validator,
    this.onValueChange,
    this.prefixIcon,
    this.suffixIcon,
    this.enableInput,
    this.headerWidget,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        headerWidget != null ? headerWidget! : const SizedBox(),
        TextFormField(
          cursorWidth: 2,
          maxLength: maxLength,
          controller: editingController,
          showCursor: true,
          validator: validator,
          onChanged: onValueChange,
          enabled: enableInput ?? true,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.done,
          keyboardType: keyboardType,
          cursorColor: AppColors.hintColor,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: isMultiline ? 5 : 1,
          decoration: InputDecoration(
            counterText: "",
            hintText: inputHint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.inputBorder,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.inputBorder,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.inputBorder,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.hintColor,
                ),
            contentPadding: const EdgeInsets.all(
              16,
            ),
            errorStyle: Theme.of(context).textTheme.bodyMedium,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: suffixIcon,
                  )
                : null,
          ),
        )
      ],
    );
  }
}
