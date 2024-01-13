import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
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
          AppBarHeader(l: t),
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
    required this.l,
  });
  final ApplicationLocalizations l;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 290,
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
        l.translate("screen_detail_page"),
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
                height: 270,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
              ),
            ),
            Hero(
              tag: "pet0",
              child: Image.asset(
                AppAssets.dogDetails,
                height: 270,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 270,
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
            bottom: 12.h,
          ),
          child: Text(
            localizations.translate("pet_menu"),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
        ),
        MenuItem(
          title: localizations.translate("medical_history"),
          iconName: AppAssets.icMedicalHistory,
          onPressMenu: () {},
        ),
        MenuItem(
          title: localizations.translate("set_feeding_schedule"),
          iconName: AppAssets.icFeedingSchedule,
          onPressMenu: () => Navigator.pushNamed(context, petFeedSchedule),
        ),
        MenuItem(
          title: localizations.translate("diet"),
          iconName: AppAssets.icDiet,
          onPressMenu: () => Navigator.pushNamed(context, petDiet),
        ),
        MenuItem(
          title: localizations.translate("nutrition"),
          iconName: AppAssets.icNutrition,
          onPressMenu: () => Navigator.pushNamed(context, petNutrition),
        ),
        MenuItem(
          title: localizations.translate("medication_details"),
          iconName: AppAssets.icMedication,
          onPressMenu: () => Navigator.pushNamed(context, petMedication),
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
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
