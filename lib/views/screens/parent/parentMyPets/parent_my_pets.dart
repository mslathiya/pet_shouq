import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

class ParentMyPets extends StatefulWidget {
  const ParentMyPets({super.key});

  @override
  State<ParentMyPets> createState() => _ParentMyPetsState();
}

class _ParentMyPetsState extends State<ParentMyPets> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: TabHeader(
        title: t.translate("tab_pets"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.only(
                top: 15.h,
                bottom: 15.h,
              ),
              itemBuilder: (context, index) {
                return MyPetItem(
                  itemIndex: index,
                  onDeletePet: () {},
                  onViewPet: () => Navigator.pushNamed(context, petDetails),
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
              onTap: () => Navigator.pushNamed(context, addPet),
              buttonTitle: t.translate("btn_add_pet"),
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
    );
  }
}
