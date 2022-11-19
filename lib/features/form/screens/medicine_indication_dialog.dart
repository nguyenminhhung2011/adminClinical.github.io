import 'package:admin_clinical/features/form/widgets/form_card.dart';
import 'package:admin_clinical/features/form/widgets/medicine_indication_widgets/medicine_information_form.dart';
import 'package:admin_clinical/features/form/widgets/medicine_indication_widgets/medicine_search_form.dart';
import 'package:admin_clinical/features/form/widgets/medicine_indication_widgets/result_medicine_indication.dart';
import 'package:admin_clinical/features/form/widgets/patient_information_form.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_decoration.dart';

class MedicineIndicationDialog extends StatelessWidget {
  const MedicineIndicationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: AppDecoration.primaryRadiusBorder,
              side: AppDecoration.primarySecondBorder,
            ),
            child: Container(
              decoration: AppDecoration.primaryDecorationContainer,
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: FormCard(
                            child: Column(
                              children: [
                                Flexible(child: PatientInformationForm()),
                                const SizedBox(height: 5),
                                AppWidget.primaryDivider,
                                const SizedBox(height: 5),
                                Flexible(child: MedicineInformationForm()),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: FormCard(child: MedicineSearchForm()),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: FormCard(child: ResultMedicineIndication()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}