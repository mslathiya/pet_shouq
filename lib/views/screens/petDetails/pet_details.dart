import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shouq/config/config.dart';
import 'package:pet_shouq/theme/theme.dart';
import 'package:pet_shouq/views/components/components.dart';

import 'widgets/pet_detail.dart';
import 'widgets/pet_info.dart';
import 'widgets/pet_other_detail.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const AppBarHeader(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: PetDetailView(localizations: t),
          ),
        ],
      ),
    );
  }
}

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 280.h,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.sp,
            right: 12.sp,
          ),
          child: SvgPicture.asset(
            AppAssets.arrowLeft,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text(
        "Detail page",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              height: 2,
              letterSpacing: 0,
              color: AppColors.white,
            ),
      ),
      actions: [
        NotificationWidget(
          iconColor: AppColors.white,
        ),
        SizedBox(
          width: 15.w,
        ),
      ],
      automaticallyImplyLeading: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        background: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                height: 230.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
              ),
            ),
            Hero(
              tag: "pet0",
              child: Image.asset(
                AppAssets.dogDetails,
                height: 230.h,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 230.h,
                decoration: BoxDecoration(
                  color: AppColors.fontMain.withOpacity(0.3),
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PetInfo(),
            ),
          ],
        ),
      ),
    );
  }
}

class PetDetailView extends StatelessWidget {
  final ApplicationLocalizations localizations;
  const PetDetailView({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const PetDetail(),
        //
        PetOtherDetails(localizations: localizations),
        //
        Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 10.h,
          ),
          child: Text(
            localizations.translate("pet_menu"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ),
        MenuItem(
          title: localizations.translate("medical_history"),
          iconName: AppAssets.icMedicalHistory,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("feeding_schedule"),
          iconName: AppAssets.icFeedingSchedule,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("diet"),
          iconName: AppAssets.icDiet,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("nutrition"),
          iconName: AppAssets.icNutrition,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("medication"),
          iconName: AppAssets.icMedication,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("vaccination"),
          iconName: AppAssets.icVaccination,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("special_needs"),
          iconName: AppAssets.icSpecialNeeds,
          onPressMenu: () {},
        )
      ],
    );
  }
}
