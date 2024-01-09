import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';

class RadioWidget extends StatelessWidget {
  final int selectedOption;
  final Function(int) onSelectOption;
  const RadioWidget({
    super.key,
    required this.selectedOption,
    required this.onSelectOption,
  });

  @override
  Widget build(BuildContext context) {
    final t = ApplicationLocalizations.of(context)!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 1,
              groupValue: selectedOption,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              activeColor: AppColors.secondary,
              onChanged: (index) => onSelectOption(1),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              t.translate("type_parent"),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: selectedOption == 2
                        ? AppColors.hintColor
                        : AppColors.fontMain,
                  ),
            )
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 2,
              groupValue: selectedOption,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              activeColor: AppColors.secondary,
              onChanged: (index) => onSelectOption(2),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              t.translate("type_vet"),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: selectedOption == 1
                        ? AppColors.hintColor
                        : AppColors.fontMain,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
