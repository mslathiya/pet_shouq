import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pet_shouq/helper/helpers.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widget/calendar_header.dart';

class CalendarAppointment extends StatefulWidget {
  const CalendarAppointment({super.key});

  @override
  State<CalendarAppointment> createState() => _CalendarAppointmentState();
}

class _CalendarAppointmentState extends State<CalendarAppointment> {
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final kFirstDay = DateTime(
    DateTime.now().year,
    DateTime.now().month - 3,
    DateTime.now().day,
  );
  final kLastDay = DateTime(
    DateTime.now().year,
    DateTime.now().month + 3,
    DateTime.now().day,
  );

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: TabHeader(
        title: t.translate("tab_appointment"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ValueListenableBuilder<DateTime>(
              valueListenable: _focusedDay,
              builder: (context, value, _) {
                return CalendarHeader(
                  focusedDay: value,
                  onLeftArrowTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  onRightArrowTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                );
              },
            ),
            TableCalendar(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay.value,
              calendarFormat: _calendarFormat,
              headerVisible: false,
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              rangeSelectionMode: _rangeSelectionMode,
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onCalendarCreated: (controller) => _pageController = controller,
              onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
              selectedDayPredicate: (day) => isSameDay(day, _focusedDay.value),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);
                  return Center(
                    child: Text(
                      text[0],
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.secondary,
                          ),
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) => _dayBuilder(
                  context,
                  day,
                  focusedDay,
                  2,
                ),
                selectedBuilder: (context, day, focusedDay) => _dayBuilder(
                  context,
                  day,
                  focusedDay,
                  1,
                ),
                defaultBuilder: (context, day, focusedDay) => _dayBuilder(
                  context,
                  day,
                  focusedDay,
                  2,
                ),
                outsideBuilder: (context, day, focusedDay) => _dayBuilder(
                  context,
                  day,
                  focusedDay,
                  3,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final EventType type = index == 2
                    ? EventType.typeBirthday
                    : EventType.typeAppointment;
                return EventListItem(
                  eventType: type,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _dayBuilder(
    BuildContext context,
    DateTime day,
    DateTime focusedDay,
    int type,
  ) {
    bool isSameDay = false;
    if (day.day == focusedDay.day) {
      isSameDay = true;
    }
    final text = DateFormat.d().format(day);
    return Container(
      height: 36.sp,
      width: 36.sp,
      decoration: BoxDecoration(
        color: type == 3
            ? Colors.transparent
            : isSameDay
                ? AppColors.secondary
                : type == 2
                    ? Colors.transparent
                    : AppColors.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(36.sp),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: isSameDay ? 14.sp : 13.sp,
                color: isSameDay
                    ? AppColors.white
                    : type == 3
                        ? AppColors.grayFaded
                        : AppColors.fontMain,
              ),
        ),
      ),
    );
  }
}
