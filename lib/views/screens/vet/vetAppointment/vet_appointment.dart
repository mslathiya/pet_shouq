import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/theme/theme.dart';

import '../../../../config/config.dart';
import '../../../../helper/helpers.dart';
import '../../../components/components.dart';
import 'widget/app_bar_widget.dart';
import 'widget/header_view.dart';

class VetAppointment extends StatefulWidget {
  const VetAppointment({super.key, required this.type});
  final AppointmentType type;

  @override
  State<VetAppointment> createState() => _VetAppointmentState();
}

class _VetAppointmentState extends State<VetAppointment>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<String> tabList = [
    "tab_current",
    "tab_upcoming",
    "tab_past",
    "tab_cancelled"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBarWidget(
            type: widget.type,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.type == AppointmentType.typeToday
                  ? const HeaderView()
                  : const SizedBox(),
              SizedBox(
                height: 48.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tabList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: _getBackgroundColor(index),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.sp,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              t.translate(tabList[index]),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 16.sp,
                                    height: 2,
                                    color: _getForegroundColor(index),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return AppColors.secondary;
    } else {
      return AppColors.timeSelector;
    }
  }

  _getForegroundColor(int index) {
    // the same as the above
    if (index == _currentIndex) {
      return AppColors.white;
    } else {
      return AppColors.hintColor;
    }
  }
}
