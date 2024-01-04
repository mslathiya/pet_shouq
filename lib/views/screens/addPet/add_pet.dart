import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../config/config.dart';
import '../../../theme/theme.dart';
import '../../components/components.dart';

class AddNewPet extends StatefulWidget {
  const AddNewPet({super.key});

  @override
  State<AddNewPet> createState() => _AddNewPetState();
}

class _AddNewPetState extends State<AddNewPet> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final t = ApplicationLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderWithBack(
            title: t.translate("btn_add_pet"),
            onPressBack: () => Navigator.pop(context),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (_, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ImagePicker(
                              onPickImage: () {},
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_pet_name"),
                              ),
                              inputHint: t.translate("hint_pet_name"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_breed"),
                              ),
                              inputHint: t.translate("hint_breed"),
                              suffixIcon: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Entypo.chevron_down,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_marking"),
                              ),
                              inputHint: t.translate("hint_marking"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_birth_date"),
                              ),
                              inputHint: t.translate("hint_birth_date"),
                              suffixIcon: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Entypo.calendar,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      compulsory: true,
                                      headerLabel: t.translate("lbl_weight"),
                                    ),
                                    inputHint: t.translate("hint_weight"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InputField(
                                    headerWidget: InputHeader(
                                      compulsory: true,
                                      headerLabel: t.translate("lbl_height"),
                                    ),
                                    inputHint: t.translate("hint_height"),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_chip_no"),
                              ),
                              inputHint: t.translate("hint_chip_no"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_spayed"),
                              ),
                              inputHint: t.translate("hint_spayed"),
                              suffixIcon: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Entypo.chevron_down,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_pedigree_front"),
                              ),
                              inputHint: t.translate("hint_pedigree_front"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_pedigree_back"),
                              ),
                              inputHint: t.translate("hint_pedigree_back"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_allergies"),
                              ),
                              inputHint: t.translate("hint_allergies"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: AppColors.secondary,
                                ),
                                Expanded(
                                  child: Text(
                                    t.translate("pet_taker_address"),
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          height: 1.2,
                                          letterSpacing: 0.20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              isMultiline: true,
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_description"),
                              ),
                              inputHint: t.translate("hint_description"),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InputField(
                              headerWidget: InputHeader(
                                compulsory: true,
                                headerLabel: t.translate("lbl_qr_code"),
                              ),
                              inputHint: t.translate("hint_qr_code"),
                              suffixIcon: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesome.qrcode,
                                    size: 26.sp,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ButtonView(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  verification,
                                ),
                                buttonTitle: t.translate("btn_submit"),
                                width: width - 20,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
