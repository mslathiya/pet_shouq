import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../components/components.dart';
import 'widgets/ingredient_info.dart';
import 'widgets/nutrition_info.dart';
import 'widgets/nutrition_price.dart';
import 'widgets/other_nutrition_info.dart';

class NutritionDetails extends StatelessWidget {
  const NutritionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_nutrition_details"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const NutritionInfo(),
                  IngredientsInfo(t: t),
                  OtherNutritionInfo(t: t),
                ],
              ),
            ),
          ),
          NutritionPrice(
            t: t,
            onPress: () => Navigator.pushNamed(
              context,
              petAddNutrition,
            ),
          )
        ],
      ),
    );
  }
}
