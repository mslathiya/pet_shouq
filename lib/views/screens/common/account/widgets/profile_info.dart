import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

class ProfileInfo extends StatelessWidget {
  final VoidCallback onTapEdit;
  const ProfileInfo({
    super.key,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 10.sp,
            right: 10.sp,
            bottom: 15.sp,
          ),
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 15.h,
            top: 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.fontMain.withOpacity(0.13),
                blurRadius: 5.sp,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  child: InkWell(
                    onTap: onTapEdit,
                    child: SvgPicture.asset(
                      AppAssets.icEdit,
                      height: 42.sp,
                      width: 42.sp,
                    ),
                  ),
                ),
              ),
              Text(
                "Deirdre Starnes",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90.w,
                    child: const LabelWithIcon(
                      asset: AppAssets.icGender,
                      value: "Male",
                    ),
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  SizedBox(
                    width: 120.w,
                    child: const LabelWithIcon(
                      asset: AppAssets.icBirthday,
                      value: "20-2-1990",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.sp,
              ),
              const LabelWithIcon(
                asset: AppAssets.icEmail,
                value: "deirdrestarnes@gmail.com",
              ),
              SizedBox(
                height: 4.sp,
              ),
              const LabelWithIcon(
                asset: AppAssets.icPhone,
                value: "+1 98250 98250 / +1 98255 98255 ",
              ),
              SizedBox(
                height: 4.sp,
              ),
              const LabelWithIcon(
                asset: AppAssets.icLocationPin,
                value:
                    "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore, karnataka - 560016",
              )
            ],
          ),
        ),
        Positioned.fill(
          top: -50,
          child: Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.elliptical(
                  80.h,
                  80.h,
                ),
              ),
              child: Image.asset(
                AppAssets.dog,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
