import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shouq/config/config.dart';
import 'package:pet_shouq/theme/theme.dart';
import 'package:pet_shouq/views/components/components.dart';

import 'widgets/clinic_info.dart';
import 'widgets/header_slider.dart';

class ClinicDetails extends StatefulWidget {
  const ClinicDetails({super.key});

  @override
  State<ClinicDetails> createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarHeader(localizations: t),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarHeader extends StatelessWidget {
  const SliverAppBarHeader({
    super.key,
    required this.localizations,
  });

  final ApplicationLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 350.h,
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
            const HeaderSlider(),
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
            Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: ClinicInfo(localizations: localizations),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailChildView extends StatelessWidget {
  const DetailChildView({super.key, required this.localizations});

  final ApplicationLocalizations localizations;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            localizations.translate("date"),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 60.sp,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const DateItem(
                  date: "1",
                  day: "Mon",
                  isSelected: false,
                  isDisabled: false,
                );
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            localizations.translate("time"),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              mainAxisExtent: 42.sp,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const TimeItem(
                isSelected: false,
                time: "10:00 Am To 10:30 Am",
                isDisabled: false,
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.center,
            child: ButtonView(
              onTap: () => Navigator.pop(context),
              buttonTitle: localizations.translate("btn_reschedule"),
              width: width * .41,
            ),
          )
        ],
      ),
    );
  }
}
