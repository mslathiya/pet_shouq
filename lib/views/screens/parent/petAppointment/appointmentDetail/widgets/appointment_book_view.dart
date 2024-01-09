import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../../config/config.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../components/components.dart';

class AppointmentBookView extends StatelessWidget {
  const AppointmentBookView({
    super.key,
    required this.t,
  });

  final ApplicationLocalizations t;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width,
          padding: EdgeInsets.all(6.sp),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.sp),
              topRight: Radius.circular(10.sp),
            ),
          ),
          child: Text(
            t.translate("btn_reschedule_appointment"),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                  height: 2,
                  color: AppColors.white,
                ),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectorField(
                                headerWidget: InputHeader(
                                  compulsory: false,
                                  headerLabel: t.translate("lbl_doctor_name"),
                                ),
                                inputHint: t.translate("hint_doctor_name"),
                                suffixIcon: SizedBox(
                                  width: 26.w,
                                  height: 26.h,
                                  child: Icon(
                                    Entypo.chevron_down,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                                onSelectItem: () {},
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                t.translate("date"),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.sp,
                                    ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SizedBox(
                                height: 60.sp,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return const DateItem(
                                      date: "1",
                                      day: "Mon",
                                      isSelected: false,
                                      isDisabled: false,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                t.translate("time"),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.sp,
                                    ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 42.sp,
                                ),
                                itemCount: 10,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return const TimeItem(
                                    isSelected: false,
                                    time: "10:00 Am To 10:30 Am",
                                    isDisabled: false,
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 10.sp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () => Navigator.pop(context),
                  buttonTitle: t.translate("btn_cancel"),
                  width: width * .41,
                  buttonStyle: TextStyle(
                    color: AppColors.hintColor,
                  ),
                  buttonColor: AppColors.inputBorder,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonView(
                  onTap: () => Navigator.pop(context),
                  buttonTitle: t.translate("btn_reschedule"),
                  width: width * .41,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
