import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../data/enum/enums.dart';
import '../../../components/components.dart';
import 'widgets/top_slider.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MainHeader(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          // Slider
          const TopSlider(),
          // Slider
          SizedBox(
            height: 5.h,
          ),
          //Bottom List
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.only(
                top: 10.sp,
                bottom: 15.sp,
              ),
              itemBuilder: (_, index) {
                return DoctorListItem(
                  onViewDetail: () {
                    Navigator.pushNamed(context, doctorDetails);
                  },
                  viewType: ViewType.typeList,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
