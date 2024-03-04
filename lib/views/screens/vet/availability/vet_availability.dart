import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/availability_controller.dart';

import '../../../../config/config.dart';
import '../../../../data/model/models.dart';
import '../../../components/components.dart';
import 'widget/list_item.dart';

class VetAvailability extends StatefulWidget {
  const VetAvailability({super.key});

  @override
  State<VetAvailability> createState() => VetAvailabilityState();
}

class VetAvailabilityState extends State<VetAvailability> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AvailabilityController>().getAvailability();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: TabHeader(
        title: "availability".tr,
      ),
      body: GetBuilder<AvailabilityController>(
        builder: (controller) {
          if (controller.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (controller.getAvailabilityResponseBean == null) {
              return Center(
                child: Text(
                  'Something went wrong',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
              );
            } else {
              if (controller.getAvailabilityResponseBean?['data'].isNotEmpty) {
                List<Availability> availability = controller.vetAvailability;
                return ListView.builder(
                  itemCount: availability.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  itemBuilder: (context, index) {
                    Availability item = availability[index];
                    return ListItem(
                      item: item,
                      controller: controller,
                      onAddTime: () {
                        controller.duplicateVetAvailableList(isClear: false);
                        Get.toNamed(
                          vetAddAvailability,
                          parameters: {
                            'index': index.toString(),
                            'name': item.day.tr
                          },
                        );
                      },
                    );
                  },
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonView(
                      onTap: () {
                        controller.duplicateVetAvailableList();
                        Get.toNamed(vetAddAvailability);
                      },
                      buttonTitle: "add_availability".tr,
                      width: width - 20,
                      buttonStyle: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }
}
