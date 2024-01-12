import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import 'label_with_icon.dart';

class PetInformation extends StatelessWidget {
  const PetInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Antonetta Muller',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          const LabelWithIcon(
            asset: AppAssets.icCalendar,
            value: '21-Dec-2023',
          ),
          const LabelWithIcon(
            asset: AppAssets.icBreed,
            value: 'German Shepherd',
          ),
        ],
      ),
    );
  }
}
