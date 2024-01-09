import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_menus.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    var t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      appBar: TabHeader(
        title: t.translate("tab_profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              ProfileInfo(
                onTapEdit: () => Navigator.pushNamed(
                  context,
                  editParentProfile,
                ),
              ),
              ProfileMenus(
                t: t,
                onTapMenu: (menuName) => Navigator.pushNamed(
                  context,
                  menuName,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: () => Navigator.pushNamed(
                          context,
                          verification,
                        ),
                        buttonTitle: t.translate("btn_logout"),
                        width: width * .45,
                        buttonStyle: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonView(
                        onTap: () => Navigator.pushNamed(
                          context,
                          verification,
                        ),
                        buttonTitle: t.translate("btn_delete_account"),
                        width: width * .45,
                        buttonColor: AppColors.deleteButton,
                        buttonStyle: TextStyle(
                          color: AppColors.redColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
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
