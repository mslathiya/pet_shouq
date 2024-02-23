import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class InfoField extends StatelessWidget {
  final String inputValue;
  final String inputHeader;

  const InfoField({
    super.key,
    required this.inputValue,
    required this.inputHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InputHeader(headerLabel: inputHeader),
        Container(
          padding: const EdgeInsets.all(
            15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
            border: Border.all(
              color: AppColors.inputBorder,
              width: 1,
            ),
            color: AppColors.inputBorder,
          ),
          child: Text(
            inputValue,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.hintColor,
                ),
          ),
        ),
      ],
    );
  }
}
