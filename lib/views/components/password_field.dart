import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../theme/theme.dart';

class PasswordField extends StatefulWidget {
  final String headerLabel;
  final TextEditingController? editingController;
  final String inputHint;
  final FormFieldValidator<String>? validator;
  final ValueChanged? onValueChange;
  final Widget? suffixIcon;
  final bool? enableInput;
  final String? inputError;

  const PasswordField({
    super.key,
    required this.headerLabel,
    this.editingController,
    required this.inputHint,
    this.validator,
    this.onValueChange,
    this.suffixIcon,
    this.enableInput,
    this.inputError,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;

  togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.headerLabel,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              WidgetSpan(
                child: SizedBox(width: 5.w),
              ),
              TextSpan(
                text: '*',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          cursorWidth: 2,
          maxLength: 64,
          controller: widget.editingController,
          showCursor: true,
          validator: widget.validator,
          onChanged: widget.onValueChange,
          enabled: widget.enableInput ?? true,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.hintColor,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: !showPassword,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            counterText: "",
            hintText: widget.inputHint,
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
            errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.redColor,
                ),
            errorText: widget.inputError,
            errorMaxLines: 5,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  showPassword
                      ? FontAwesome5Regular.eye
                      : FontAwesome5Regular.eye_slash,
                  size: 20.sp,
                  color: AppColors.hintColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
