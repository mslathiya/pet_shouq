import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../components/components.dart';
import 'widgets/diet_info.dart';
import 'widgets/other_details.dart';
import 'widgets/time_chart.dart';

class DietDetails extends StatelessWidget {
  const DietDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Scaffold(
      appBar: HeaderWithBack(
        title: t.translate("screen_diet_log_details"),
        onPressBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DietInfo(),
            const TimeChart(),
            OtherDetails(t: t),
          ],
        ),
      ),
    );
  }
}
