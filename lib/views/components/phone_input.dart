import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import 'code_picker.dart';
import 'input_field.dart';
import 'input_header.dart';

class PhoneInput extends StatefulWidget {
  final String headerLabel;
  final bool? isCompulsory;
  final TextEditingController? editingController;
  final FormFieldValidator<String>? validator;
  final ValueChanged? onValueChange;
  final bool? enableInput;
  final int? maxLength;
  final Function(CountryCode countryCode)? onCountryChanged;
  final String? countryDialCode;
  final String? inputError;

  const PhoneInput({
    super.key,
    required this.headerLabel,
    this.isCompulsory = false,
    this.editingController,
    this.validator,
    this.onValueChange,
    this.enableInput,
    this.maxLength,
    this.onCountryChanged,
    this.countryDialCode,
    this.inputError,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return InputField(
      inputError: widget.inputError,
      headerWidget: InputHeader(
        compulsory: widget.isCompulsory!,
        headerLabel: widget.headerLabel,
      ),
      inputHint: "hint_phone".tr,
      keyboardType: TextInputType.phone,
      maxLength: widget.maxLength,
      editingController: widget.editingController,
      validator: widget.validator,
      onValueChange: widget.onValueChange,
      enableInput: widget.enableInput ?? true,
      prefixIcon: SizedBox(
        width: 90.w,
        height: 42.h,
        child: Row(
          children: [
            Container(
              width: 75.w,
              height: 42.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sp),
                  bottomLeft: Radius.circular(10.sp),
                ),
              ),
              margin: const EdgeInsets.only(right: 0),
              padding: const EdgeInsets.only(left: 5),
              child: Center(
                child: CodePickerWidget(
                  boxDecoration:
                      BoxDecoration(color: Theme.of(context).cardColor),
                  flagWidth: 25,
                  padding: EdgeInsets.zero,
                  onChanged: widget.onCountryChanged,
                  initialSelection: widget.countryDialCode,
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.2,
                        letterSpacing: 0.20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                  searchStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.2,
                        letterSpacing: 0.20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                ),
              ),
            ),
            Container(
              height: 36.h,
              width: 2,
              color: Theme.of(context).disabledColor,
            )
          ],
        ),
      ),
    );
  }
}
