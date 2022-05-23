import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/widgets/activity_choice_chip.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/widgets/custom_list_view.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:explora_habitat/ui/widgets/custom_material_button.dart';
import 'package:explora_habitat/ui/widgets/text_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateActivityModal extends StatelessWidget {

  final bool readOnly;

  CreateActivityModal({this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    final ActivityStore activityStore = Provider.of<ActivityStore>(context);

    return Dialog(
      shape: kRoundedRectangleBorder,
      elevation: 8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.lightGreen,
              ),
              child: const Text(
                'Atividade',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CustomFormField(
                        initialValue: activityStore.title,
                        labelText: 'Título',
                        errorText: activityStore.titleError,
                        inputType: TextInputType.text,
                        onChanged: activityStore.setTitle,
                        enabled: !readOnly,
                      ),
                    ),
                  ),
                  const TextLabel('Recursos'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: 40,
                      child: ActivityChoiceChip(readOnly: readOnly),
                    ),
                  ),
                  const TextLabel('Perguntas'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: CustomListView(readOnly: readOnly),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomMaterialButtom(
                          color: Colors.red,
                          text: 'Cancelar',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Observer(
                        builder: (_) => CustomMaterialButtom(
                          color: Colors.green,
                          text: 'Salvar',
                          onPressed: activityStore.activityValid && !readOnly
                              ? () {
                                  final createdActivity =
                                      activityStore.createActivity();
                                  Navigator.pop(context, createdActivity);
                                }
                              : null,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
