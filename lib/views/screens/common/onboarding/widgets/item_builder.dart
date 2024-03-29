import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models.dart';

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    super.key,
    required this.item,
    required this.title,
    required this.subTitle,
  });

  final Onboarding item;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item.image,
                      height: 340,
                      width: 346,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      title.tr,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            height: 1.2,
                            letterSpacing: 0.20,
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      subTitle.tr,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
