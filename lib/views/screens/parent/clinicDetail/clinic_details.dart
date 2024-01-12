import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/config.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'widgets/booking_view.dart';
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
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarHeader(localizations: t),
          SliverFillRemaining(
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
      expandedHeight: 315,
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
                height: 230,
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
        children: [
          SizedBox(
            height: 5.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localizations.translate("date"),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 15.sp,
                      ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 5.w),
                ),
                TextSpan(
                  text: '*',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 55.sp,
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
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localizations.translate("time"),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 15.sp,
                      ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 5.w),
                ),
                TextSpan(
                  text: '*',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            primary: false,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              mainAxisExtent: 42.sp,
            ),
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
              onTap: () => _dialogBuilder(context, localizations),
              buttonTitle: localizations.translate("btn_book_now"),
              width: width - 40,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context, ApplicationLocalizations t) {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        double height = MediaQuery.of(context).size.height;
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {},
          child: Center(
            child: Container(
              height: height * .6,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: AppointmentBookingView(
                t: t,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
