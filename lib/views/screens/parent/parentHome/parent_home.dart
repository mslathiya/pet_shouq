import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/config/config.dart';
import 'package:pet_shouq/helper/helpers.dart';

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const MainHeader(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            // Slider
            const TopSlider(),
            // Slider
            SizedBox(
              height: 15.h,
            ),
            //Bottom List
            Expanded(
              child: ListView.builder(
                itemCount: 15,
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
      ),
    );
  }
}
