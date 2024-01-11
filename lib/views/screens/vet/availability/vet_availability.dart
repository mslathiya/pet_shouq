import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../config/config.dart';
import '../../../../data/models.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class VetAvailability extends StatefulWidget {
  const VetAvailability({super.key});

  @override
  State<VetAvailability> createState() => VetAvailabilityState();
}

class VetAvailabilityState extends State<VetAvailability> {
  List<Availability> availability = [
    Availability(
      day: "monday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    ),
    Availability(
      day: "tuesday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    ),
    Availability(
      day: "wednesday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    ),
    Availability(
      day: "thursday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    ),
    Availability(
      day: "friday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    ),
    Availability(
      day: "saturday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    ),
    Availability(
      day: "sunday",
      isClosed: false,
      timing: [
        AvailabilityTiming(startTime: "", endTime: ""),
      ],
    )
  ];

  void addNewTime(int parentIndex) {
    List<AvailabilityTiming> timing = availability[parentIndex].timing;
    timing.add(
      AvailabilityTiming(endTime: "", startTime: ""),
    );
    setState(() {
      availability;
    });
  }

  void removeTime(int parentIndex, int childIndex) {
    List<AvailabilityTiming> timing = availability[parentIndex].timing;
    timing.removeAt(childIndex);
    setState(() {
      availability;
    });
  }

  Future<void> openTimePicker(
    BuildContext superContext,
    int parentIndex,
    int childIndex,
    int type,
  ) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
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

    if (!context.mounted) {
      return;
    }
    if (timeOfDay != null) {
      List<AvailabilityTiming> timing = availability[parentIndex].timing;
      AvailabilityTiming time = timing[childIndex];

      if (type == 0) {
        String timeValue = timeOfDay.format(context);
        time.startTime = timeValue;
      } else if (type == 1) {
        String timeValue = timeOfDay.format(context);
        time.endTime = timeValue;
      }
      setState(() {
        availability;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: HeaderWithBack(
          title: t.translate("availability"),
          onPressBack: () => Navigator.pop(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: availability.length,
                itemBuilder: (context, index) {
                  Availability item = availability[index];
                  return ListTileItem(
                    item: item,
                    onSelectTime: (childIndex, type) =>
                        openTimePicker(context, index, childIndex, type),
                    onAddTime: () => addNewTime(index),
                    onRemoveTime: (childIndex) => removeTime(index, childIndex),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    required this.item,
    required this.onSelectTime,
    required this.onAddTime,
    required this.onRemoveTime,
  });

  final Availability item;
  final Function(int, int) onSelectTime;
  final VoidCallback onAddTime;
  final Function(int) onRemoveTime;

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;

    return ShadowBox(
      withPadding: false,
      isExpanded: true,
      childWidget: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0.0,
        horizontalTitleGap: 0,
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          initiallyExpanded: false,
          collapsedShape: const Border(),
          shape: const Border(),
          iconColor: AppColors.fontMain,
          title: Text(
            t.translate(item.day),
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          expandedAlignment: Alignment.topLeft,
          children: [
            // DisplayTiming()
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.maximumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  value: item.isClosed,
                  onChanged: (value) {},
                  activeColor: AppColors.secondary,
                ),
                Expanded(
                  child: Text(
                    t.translate("closed"),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.2,
                          letterSpacing: 0.20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: item.timing.asMap().entries.map((e) {
                int index = e.key.toInt();
                AvailabilityTiming item = e.value;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SelectorField(
                              inputHint: item.startTime != ''
                                  ? item.startTime
                                  : t.translate("start_time"),
                              suffixIcon: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: Icon(
                                  FontAwesome5Solid.clock,
                                  color: AppColors.hintColor,
                                  size: 22.sp,
                                ),
                              ),
                              onSelectItem: () => onSelectTime(index, 0),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: SelectorField(
                              inputHint: item.endTime != ''
                                  ? item.endTime
                                  : t.translate("end_time"),
                              suffixIcon: SizedBox(
                                width: 22.w,
                                height: 22.h,
                                child: Icon(
                                  FontAwesome5Solid.clock,
                                  color: AppColors.hintColor,
                                  size: 22.sp,
                                ),
                              ),
                              onSelectItem: () => onSelectTime(index, 1),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          index == 0
                              ? GestureDetector(
                                  onTap: onAddTime,
                                  child: Container(
                                    height: 45.sp,
                                    width: 32.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp),
                                      ),
                                    ),
                                    child: Icon(
                                      Entypo.plus,
                                      color: AppColors.secondary,
                                      size: 22.sp,
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      index > 0
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () => onRemoveTime(index),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      AntDesign.delete,
                                      color: AppColors.redColor,
                                      size: 22.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      t.translate("remove"),
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.redColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
