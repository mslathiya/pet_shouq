import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../components/components.dart';

class TopAsked extends StatefulWidget {
  const TopAsked({super.key});

  @override
  State<TopAsked> createState() => _TopAskedState();
}

class _TopAskedState extends State<TopAsked> {
  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_faq"),
        onPressBack: () => Navigator.pop(context),
        showNotification: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.only(
                  bottom: 15.h,
                  top: 15.h,
                ),
                itemBuilder: (context, index) {
                  return TopAskedItem(
                    itemIndex: index,
                  );
                },
              ),
            ),
            Platform.isAndroid
                ? SizedBox(
                    height: 15.h,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
