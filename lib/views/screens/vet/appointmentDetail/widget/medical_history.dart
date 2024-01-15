import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../data/models.dart';
import '../../../../../theme/theme.dart';
import '../../../../components/components.dart';
import 'contact_card.dart';
import 'medical_specification.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var t = ApplicationLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicalSpecification(),
        SingleLabelItem(
          title: t.translate("breed_marking"),
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
          title: t.translate("vaccination_record"),
        ),
        ExpandableBox(
          title: t.translate("medications"),
          infoList: [
            MedicalInfo(
              title: t.translate("lbl_medication_name"),
              description: "Heartgard",
            ),
            MedicalInfo(
              title: t.translate("lbl_dosage"),
              description: "68 mcg",
            ),
            MedicalInfo(
              title: t.translate("lbl_frequency"),
              description: "Monthly",
            ),
            MedicalInfo(
              title: t.translate("hint_prescription_reason"),
              description: "Heartworm prevention",
            ),
            MedicalInfo(
              title: t.translate("old_illness"),
              description:
                  "December 2022,Gastrointestinal infection, treated with antibiotics",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("allergies"),
          infoList: [
            MedicalInfo(
              title: t.translate("food_allergies"),
              description: "Allergic to chicken-based dog food",
            ),
            MedicalInfo(
              title: t.translate("medication_allergy"),
              description: "Allergic to penicillin",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("dietary_info"),
          infoList: [
            MedicalInfo(
              title: t.translate("dog_food"),
              description: "Brand X Adult Dog Food",
            ),
            MedicalInfo(
              title: t.translate("feeding_schedule"),
              description: "Twice a day (1.5 cups per meal)",
            ),
            MedicalInfo(
              title: t.translate("dietary_restriction"),
              description: "No table scraps,limited treats",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("parasite_control"),
          infoList: [
            MedicalInfo(
              title: t.translate("dog_food"),
              description: "Brand X Adult Dog Food",
            ),
            MedicalInfo(
              title: t.translate("flea_tick_control"),
              description: "Frontline Plus, last applied on 2023-04-01",
            ),
            MedicalInfo(
              title: t.translate("heartworm_prevention"),
              description: " Heartgard, last administered on 2023-05-01",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("dental_care"),
          infoList: [
            MedicalInfo(
              title: t.translate("dental_cleaning"),
              description: "Last dental cleaning on 2023-03-20, no extractions",
            ),
            MedicalInfo(
              title: t.translate("dental_issues"),
              description: "Mild tartar buildup",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("vet_visits"),
          infoList: [
            MedicalInfo(
              title: t.translate("last_visit"),
              description: "2023-08-15 (Annual check-up)",
            ),
            MedicalInfo(
              title: t.translate("reason"),
              description: "Routine check-up, vaccinations updated",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("behavior_training"),
          infoList: [
            MedicalInfo(
              title: t.translate("behavior_note"),
              description: "Bella has separation anxiety.",
            ),
            MedicalInfo(
              title: t.translate("training_progress"),
              description: "Completed basic obedience training in 2022.",
            ),
          ],
        ),
        ExpandableBox(
          title: t.translate("grooming_hygiene"),
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                t.translate("grooming_needs"),
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
          title: t.translate("miscellaneous_note"),
          infoList: const [],
          customWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                t.translate("miscellaneous"),
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
