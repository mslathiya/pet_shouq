import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'widgets/day_view.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  int selectedOption = 1;
  int activeTab = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      activeTab = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;
    double idealSize = width / 7 - 12.w;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_add_feed_schedule"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: width * 0.55,
                          width: width * 0.55,
                          child: GestureDetector(
                            onTap: () => openTimePicker(context),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    AppAssets.timeContainer,
                                    height: width * 0.6,
                                    width: width * 0.6,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '12:00:00',
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 28.sp,
                                                  fontWeight: FontWeight.w900,
                                                  height: 1.5,
                                                ),
                                          ),
                                          Text(
                                            'PM',
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              onTap: () => {
                                setState(() {
                                  activeTab = 1;
                                })
                              },
                              buttonTitle: t.translate("type_single"),
                              width: width * 0.44,
                              buttonColor: activeTab == 2
                                  ? AppColors.timeSelector
                                  : AppColors.secondary,
                              buttonStyle: TextStyle(
                                fontSize: 7.sp,
                                color: activeTab == 2
                                    ? AppColors.grayFaded
                                    : AppColors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonView(
                              onTap: () => {
                                setState(() {
                                  activeTab = 2;
                                })
                              },
                              buttonTitle: t.translate("type_multiple"),
                              width: width * 0.44,
                              buttonColor: activeTab == 1
                                  ? AppColors.timeSelector
                                  : AppColors.secondary,
                              buttonStyle: TextStyle(
                                fontSize: 7.sp,
                                color: activeTab == 1
                                    ? AppColors.grayFaded
                                    : AppColors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      activeTab == 2
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.sp,
                              ),
                              margin: EdgeInsets.only(
                                bottom: 15.sp,
                                top: 15.sp,
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
                              child: ListTileTheme(
                                contentPadding: EdgeInsets.zero,
                                minVerticalPadding: 0.0,
                                horizontalTitleGap: 0,
                                dense: true,
                                child: ExpansionTile(
                                  childrenPadding:
                                      EdgeInsets.symmetric(vertical: 8.sp),
                                  tilePadding: EdgeInsets.zero,
                                  initiallyExpanded: true,
                                  collapsedShape: const Border(),
                                  shape: const Border(),
                                  iconColor: AppColors.fontMain,
                                  title: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: t.translate("repeat"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(fontSize: 14.sp),
                                      children: [
                                        TextSpan(
                                          text: '*',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(color: Colors.red),
                                        ),
                                        WidgetSpan(
                                          child: SizedBox(
                                            width: 5.w,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "(Mon, Tue)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.hintColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "S",
                                          isActive: false,
                                        ),
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "M",
                                          isActive: true,
                                        ),
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "T",
                                          isActive: true,
                                        ),
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "W",
                                          isActive: false,
                                        ),
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "T",
                                          isActive: false,
                                        ),
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "F",
                                          isActive: false,
                                        ),
                                        DayView(
                                          idealSize: idealSize,
                                          dayName: "S",
                                          isActive: false,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 15.h,
                            ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: true,
                          headerLabel: t.translate("lbl_title"),
                        ),
                        inputHint: t.translate("hint_title"),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InputField(
                        headerWidget: InputHeader(
                          compulsory: false,
                          headerLabel: t.translate("lbl_note"),
                        ),
                        inputHint: t.translate("hint_note"),
                        isMultiline: true,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ButtonView(
                          onTap: () => Navigator.pop(
                            context,
                          ),
                          buttonTitle: t.translate("btn_save"),
                          width: width - 20,
                          buttonStyle: TextStyle(
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> openTimePicker(BuildContext superContext) async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      orientation: Orientation.portrait,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: false,
              ),
              child: child!,
            ),
          ),
        );
      },
    );
  }
}
