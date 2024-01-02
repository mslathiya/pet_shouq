import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/data/onboarding.dart';
import 'package:pet_shouq/theme/theme.dart';

import '../../../config/config.dart';
import 'widgets/circle_indicator.dart';
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
    final appLocalizations = ApplicationLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        child: SafeArea(
          child: Column(
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

                    String title = appLocalizations.translate(item.title);
                    String subTitle = appLocalizations.translate(item.content);

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item.image,
                            height: 287,
                            width: 346,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  height: 1.2,
                                  letterSpacing: 0.20,
                                  fontWeight: FontWeight.w700,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                          Navigator.pushNamed(context, login);
                        },
                      )
                    ],
                  ))
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
