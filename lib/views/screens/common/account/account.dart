import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../controller/controllers.dart';
import '../../../../data/enum/enums.dart';
import '../../../../helper/helpers.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_menus.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.userType});

  final UserType userType;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    Get.find<AuthController>().getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: TabHeader(
        title: "tab_profile".tr,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
              ),
              ProfileInfo(
                onTapEdit: () {
                  if (widget.userType == UserType.typeParent) {
                    Get.toNamed(
                      editParentProfile,
                    );
                  } else {
                    Get.toNamed(
                      vetEditProfile,
                    );
                  }
                },
              ),
              widget.userType == UserType.typeVet
                  ? Column(
                      children: [
                        SingleLabelItem(
                          title: "specialization".tr,
                          subTitle: "Surgery, Dermatology, Nutrition",
                          asset: AppAssets.icDoctor,
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    )
                  : const SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              ProfileMenus(
                onTapMenu: (menuName) => Get.toNamed(
                  menuName,
                ),
                userType: widget.userType,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Align(
                  alignment: Alignment.center,
                  child: ButtonView(
                    onTap: () {
                      CommonHelper.dialogBuilderDeleteItem(
                        title: "btn_logout".tr,
                        subTitle: "message_logout".tr,
                        onPressOkay: () {
                          Get.find<AuthController>().logoutCurrentUser();
                        },
                        buttonText: "btn_logout".tr,
                      );
                    },
                    buttonTitle: "btn_logout".tr,
                    width: width * .9,
                    buttonStyle: TextStyle(
                      fontSize: 8.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
