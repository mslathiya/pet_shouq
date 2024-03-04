import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';

import '../../../../config/config.dart';
import '../../../../data/enum/enums.dart';
import '../../../components/components.dart';
import 'widgets/top_slider.dart';
import 'widgets/vet_list_loading.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  VetDataController vetDataController = Get.find();

  @override
  void initState() {
    vetDataController.getVetData(latitude: "22.2734662", longitude: '70.7388955');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MainHeader(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                // Slider
                const TopSlider(),
                // Slider
                SizedBox(
                  height: 5.h,
                ),
                //Bottom List
                GetBuilder<VetDataController>(
                  builder: (controller) {
                    if (controller.loadingVet && controller.currentPage == 1) {
                      return const VetListLoading();
                    } else if (controller.vetDataList.isEmpty) {
                      return const Expanded(child: Center(child: Text(
                        'No Vet found', style: TextStyle(fontSize: 16),)));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.vetDataList.length,
                        padding: EdgeInsets.only(
                          top: 10.sp,
                          bottom: 15.sp,
                        ),
                        itemBuilder: (_, index) {
                          return DoctorListItem(
                            onViewDetail: () async {
                              final response = await controller.getVetDetailsData(
                                  veterinarianId:
                                  controller.vetDataList[index].veterinarianId
                                      .toString());
                              Get.toNamed(doctorDetails, arguments: [
                                {
                                  "veterinarian_id":
                                  controller.vetDataList[index].veterinarianId
                                },
                                {"info": response}
                              ]);
                            },
                            viewType: ViewType.typeList,
                            doctorData: controller.vetDataList[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          GetBuilder<VetDataController>(builder: (controller) {
            if (controller.loadingVetDetails) {
              return const Positioned.fill(
                child: SizedBox(
                  height: 76,
                  width: 76,
                  child: Center(
                    child: ShadowBox(
                      childWidget: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },)


        ],
      ),
    );
  }
}
