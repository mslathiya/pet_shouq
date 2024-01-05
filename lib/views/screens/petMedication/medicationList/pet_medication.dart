import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class PetMedication extends StatefulWidget {
  const PetMedication({super.key});

  @override
  State<PetMedication> createState() => _PetMedicationState();
}

class _PetMedicationState extends State<PetMedication> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: HeaderWithBack(
          title: t.translate("pet_medication"),
          onPressBack: () => Navigator.pop(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                  return MedicationListItem(
                    onViewDetail: () {
                      Navigator.pushNamed(context, petMedicationDetail);
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonView(
                onTap: () => Navigator.pushNamed(context, petAddMedication),
                buttonTitle: t.translate("btn_add_medication"),
                width: width - 20,
                leftWidget: Padding(
                  padding: EdgeInsets.only(
                    right: 5.w,
                  ),
                  child: Icon(
                    Entypo.plus,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
