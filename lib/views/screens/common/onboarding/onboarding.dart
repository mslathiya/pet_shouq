import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../data/model/models.dart';
import '../../../../theme/theme.dart';
import 'widgets/circle_indicator.dart';
import 'widgets/item_builder.dart';
import 'widgets/page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Onboarding> onboardingList = [
    Onboarding(
      title: "intro_header_one",
      content: "intro_message_one",
      image: AppAssets.introOne,
    ),
    Onboarding(
      title: "intro_header_two",
      content: "intro_message_two",
      image: AppAssets.introTwo,
    ),
    Onboarding(
      title: "intro_header_three",
      content: "intro_message_three",
      image: AppAssets.introThree,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: onboardingList.length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = onboardingList[index];

                        return FadedScaleAnimation(
                          child: ItemBuilder(
                            item: item,
                            title: item.title,
                            subTitle: item.content,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        bottom: 45.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PageIndicator(
                            controller: _pageController,
                            onDotClicked: (count) {
                              _pageController.animateToPage(
                                count,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            length: onboardingList.length,
                          ),
                          CircleIndicator(
                            percent: _getPercent(_currentPage),
                            activePage: _currentPage,
                            totalPage: onboardingList.length,
                            onPressNext: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            onPressSkip: () {
                              Get.toNamed(login);
                            },
                            onAnimationEnd: () {
                              if (_currentPage != onboardingList.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              } else {
                                Get.toNamed(login);
                              }
                            },
                          )
                        ],
                      ))
                ],
              ),
              Positioned(
                right: 15,
                top: 10,
                child: GestureDetector(
                  onTap: () => Get.toNamed(login),
                  child: Text(
                    "skip".tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.2,
                          letterSpacing: 0.20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _getPercent(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 0.25;
      case 1:
        return 0.65;
      case 2:
        return 1;
      default:
        return 0;
    }
  }
}
