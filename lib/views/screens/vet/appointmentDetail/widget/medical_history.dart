import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data/model/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';

import 'medical_specification.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicalSpecification(),
        SingleLabelItem(
          title: "breed_marking".tr,
          subTitle: "Golden Retriever,\nGolden with white chest",
          asset: AppAssets.icDog,
        ),
        const EmergencyContactCard(),
        ExpandableBox(
          infoList: [
            MedicalInfo(
              title: "Rabies Vaccine",
              description: " Last administered\non 2023-05-15",
            ),
            MedicalInfo(
              title: "Distemper/Parvovirus Combo",
              description: " Last administered\non 2023-05-10",
            )
          ],
          title: "vaccination_record".tr,
        ),
        ExpandableBox(
          title: "medications".tr,
          infoList: [
            MedicalInfo(
              title: "lbl_medication_name".tr,
              description: "Heartgard",
            ),
            MedicalInfo(
              title: "lbl_dosage".tr,
              description: "68 mcg",
            ),
            MedicalInfo(
              title: "lbl_frequency".tr,
              description: "Monthly",
            ),
            MedicalInfo(
              title: "hint_prescription_reason".tr,
              description: "Heartworm prevention",
            ),
            MedicalInfo(
              title: "old_illness".tr,
              description:
                  "December 2022,Gastrointestinal infection, treated with antibiotics",
            ),
          ],
        ),
        ExpandableBox(
          title: "allergies".tr,
          infoList: [
            MedicalInfo(
              title: "food_allergies".tr,
              description: "Allergic to chicken-based dog food",
            ),
            MedicalInfo(
              title: "medication_allergy".tr,
              description: "Allergic to penicillin",
            ),
          ],
        ),
        ExpandableBox(
          title: "dietary_info".tr,
          infoList: [
            MedicalInfo(
              title: "dog_food".tr,
              description: "Brand X Adult Dog Food",
            ),
            MedicalInfo(
              title: "feeding_schedule".tr,
              description: "Twice a day (1.5 cups per meal)",
            ),
            MedicalInfo(
              title: "dietary_restriction".tr,
              description: "No table scraps,limited treats",
            ),
          ],
        ),
        ExpandableBox(
          title: "parasite_control".tr,
          infoList: [
            MedicalInfo(
              title: "dog_food".tr,
              description: "Brand X Adult Dog Food",
            ),
            MedicalInfo(
              title: "flea_tick_control".tr,
              description: "Frontline Plus, last applied on 2023-04-01",
            ),
            MedicalInfo(
              title: "heartworm_prevention".tr,
              description: " Heartgard, last administered on 2023-05-01",
            ),
          ],
        ),
        ExpandableBox(
          title: "dental_care".tr,
          infoList: [
            MedicalInfo(
              title: "dental_cleaning".tr,
              description: "Last dental cleaning on 2023-03-20, no extractions",
            ),
            MedicalInfo(
              title: "dental_issues".tr,
              description: "Mild tartar buildup",
            ),
          ],
        ),
        ExpandableBox(
          title: "vet_visits".tr,
          infoList: [
            MedicalInfo(
              title: "last_visit".tr,
              description: "2023-08-15 (Annual check-up)",
            ),
            MedicalInfo(
              title: "reason".tr,
              description: "Routine check-up, vaccinations updated",
            ),
          ],
        ),
        ExpandableBox(
          title: "behavior_training".tr,
          infoList: [
            MedicalInfo(
              title: "behavior_note".tr,
              description: "Bella has separation anxiety.",
            ),
            MedicalInfo(
              title: "training_progress".tr,
              description: "Completed basic obedience training in 2022.",
            ),
          ],
        ),
        ExpandableBox(
          title: "grooming_hygiene".tr,
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "grooming_needs".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bathed monthly, brushed weekly, nails trimmed every 6 weeks",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
        ExpandableBox(
          title: "miscellaneous_note".tr,
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "miscellaneous".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Bella loves playing fetch and enjoys long walks. She dislikes thunderstorms and fireworks and becomes anxious during these events.",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.hintColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
