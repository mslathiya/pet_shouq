import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarHeader(),
          SliverFillRemaining(
            child: DetailChildView(),
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
      expandedHeight: 300,
      leading: InkWell(
        onTap: () => Get.back(),
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
        "screen_detail_page".tr,
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
            const HeaderSlider(),
            const Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: ClinicInfo(),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailChildView extends StatelessWidget {
  const DetailChildView({super.key});

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
          InputHeader(
            headerLabel: "date".tr,
            compulsory: true,
            headerStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.sp,
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
                return DateItem(
                  index: index,
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
          InputHeader(
            headerLabel: "time".tr,
            compulsory: true,
            headerStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.sp,
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
              onTap: _dialogBuilder,
              buttonTitle: "btn_book_now".tr,
              width: width - 40,
              buttonStyle: TextStyle(
                fontSize: 7.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _dialogBuilder() {
    Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        double height = MediaQuery.of(Get.context!).size.height;
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {},
          child: Center(
            child: Container(
              height: height * .6,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const AppointmentBookingView(),
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
