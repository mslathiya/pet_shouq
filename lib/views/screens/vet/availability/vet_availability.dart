import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../data/model/models.dart';
import '../../../components/components.dart';
import 'widget/list_item.dart';

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

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: TabHeader(
        title: t.translate("availability"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: availability.length,
              itemBuilder: (context, index) {
                Availability item = availability[index];
                return ListItem(
                  item: item,
                  onAddTime: () {
                    Navigator.pushNamed(context, vetAddAvailability);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
