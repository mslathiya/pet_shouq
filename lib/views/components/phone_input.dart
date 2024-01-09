import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';
import '../../theme/theme.dart';
import 'code_picker.dart';
import 'input_field.dart';
import 'input_header.dart';

class PhoneInput extends StatelessWidget {
  final String headerLabel;
  final bool? isCompulsory;
  const PhoneInput({
    super.key,
    required this.headerLabel,
    this.isCompulsory = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = ApplicationLocalizations.of(context)!;
    return InputField(
      headerWidget: InputHeader(
        compulsory: isCompulsory!,
        headerLabel: headerLabel,
      ),
      inputHint: t.translate("hint_phone"),
      keyboardType: TextInputType.phone,
      prefixIcon: SizedBox(
        width: 90.w,
        height: 42.h,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: CodePickerWidget(
                  boxDecoration:
                      BoxDecoration(color: Theme.of(context).cardColor),
                  flagWidth: 24.sp,
                  padding: EdgeInsets.zero,
                  onChanged: (value) {},
                  initialSelection: t.getLocale(),
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
            Padding(
              padding: EdgeInsets.only(
                top: 3.h,
                bottom: 3.h,
                right: 5.w,
              ),
              child: VerticalDivider(
                color: AppColors.hintColor,
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
