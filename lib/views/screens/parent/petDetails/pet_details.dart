import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../controller/controllers.dart';
import '../../../../data/model/models.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import '../../../../helper/helpers.dart';
import 'widgets/pet_detail.dart';
import 'widgets/pet_info.dart';
import 'widgets/pet_other_detail.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  late PetInformation info;
  late int index;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      index = argumentData[0]['index'];
      info = argumentData[1]['info'];
      setState(() {
        info;
        index;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          AppBarHeader(
            info: info,
            index: index,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: PetDetailView(
              info: info,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
    required this.info,
    required this.index,
  });
  final PetInformation info;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool haveImage = false;
    String imagePath = "";
    if (info.petProfilePhoto != null) {
      imagePath = info.fullProfileImageUrl.toString();
      haveImage = imagePath.hasValidUrl();
    }

    return SliverAppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 320,
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
            Hero(
              tag: "pet$index",
              child: !haveImage
                  ? Image.asset(
                      AppAssets.dogDetails,
                      height: 270,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: imagePath,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 60),
                      fadeInCurve: Curves.easeIn,
                      height: 270,
                      width: double.maxFinite,
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PetInfo(
                info: info,
                onPressEdit: () {
                  Get.offNamed(addPet, arguments: [
                    {
                      "mode": "Edit",
                    },
                    {"info": info}
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetDetailView extends StatelessWidget {
  const PetDetailView({super.key, required this.info});

  final PetInformation info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PetDetail(
          info: info,
        ),
        PetOtherDetails(
          info: info,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 12.h,
          ),
          child: Text(
            "pet_menu".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
        ),
        MenuItem(
          title: "medical_history".tr,
          iconName: AppAssets.icMedicalHistory,
          onPressMenu: () {},
        ),
        MenuItem(
          title: "set_feeding_schedule".tr,
          iconName: AppAssets.icFeedingSchedule,
          onPressMenu: () => Get.toNamed(petFeedSchedule),
        ),
        MenuItem(
          title: "diet".tr,
          iconName: AppAssets.icDiet,
          onPressMenu: () {
            Get.put(DietLogController(
              repository: Get.find(),
              petId: info.petId ?? -1,
            ));
            Get.toNamed(petDiet);
          },
        ),
        MenuItem(
          title: "nutrition".tr,
          iconName: AppAssets.icNutrition,
          onPressMenu: () {
            Get.put(NutritionController(
              repository: Get.find(),
              petId: info.petId ?? -1,
            ));
            Get.toNamed(petNutrition);
          },
        ),
        MenuItem(
          title: "medication_details".tr,
          iconName: AppAssets.icMedication,
          onPressMenu: () {
            Get.put(MedicationController(
              repository: Get.find(),
              petId: info.petId ?? -1,
            ));
            Get.toNamed(petMedication);
          },
        ),
        MenuItem(
          title: "vaccination".tr,
          iconName: AppAssets.icVaccination,
          onPressMenu: () {},
        ),
        MenuItem(
          title: "special_needs".tr,
          iconName: AppAssets.icSpecialNeeds,
          onPressMenu: () {
            Get.put(SpecialNoteController(
              repository: Get.find(),
              petId: info.petId ?? -1,
            ));
            Get.offNamed(
              petSpecialNotes,
              arguments: [
                {
                  "info": info,
                }
              ],
            );
          },
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
