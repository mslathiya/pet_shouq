import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shouq/theme/theme.dart';

import 'widgets/header_slider.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarHeader(),
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
      elevation: 0,
      pinned: true,
      centerTitle: false,
      stretch: true,
      expandedHeight: 190.h,
      leading: Container(),
      automaticallyImplyLeading: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: const HeaderSlider(),
      ),
    );
  }
}
