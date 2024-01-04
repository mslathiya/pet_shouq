import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shouq/config/config.dart';
import 'package:pet_shouq/theme/theme.dart';
import 'package:pet_shouq/views/components/components.dart';

import '../../../helper/helpers.dart';
import 'widgets/header_slider.dart';
import 'widgets/location_widget.dart';
import 'widgets/schedule_widget.dart';

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
          const SliverAppBarHeader(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: DetailChildView(localizations: t),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarHeader extends StatelessWidget {
  const SliverAppBarHeader({
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
              bottom: 0,
              left: 0,
              right: 0,
              child: DoctorListItem(
                onViewDetail: () {},
                viewType: ViewType.typeDetail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailChildView extends StatelessWidget {
  final ApplicationLocalizations localizations;
  const DetailChildView({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LocationWidget(localizations: localizations),
        SizedBox(
          height: 5.h,
        ),
        ScheduleWidget(localizations: localizations),
      ],
    );
  }
}
