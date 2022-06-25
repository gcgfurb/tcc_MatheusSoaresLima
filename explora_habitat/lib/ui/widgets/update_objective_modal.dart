import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/objective_store.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:explora_habitat/ui/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UpdateObjectiveModal extends StatelessWidget {
  final ObjectiveStore objectiveStore;

  UpdateObjectiveModal(this.objectiveStore);

  @override
  Widget build(BuildContext context) {
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
                'Editar Objetivo',
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
                children: [
                  Observer(
                    builder: (_) =>
                        CustomFormField(
                          errorText: objectiveStore.titleError,
                          labelText: 'Título',
                          inputType: TextInputType.text,
                          onChanged: objectiveStore.setTitle,
                          initialValue: objectiveStore.title,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomMaterialButtom(
                    color: Colors.red,
                    text: 'Cancelar',
                    onPressed: () {
                      objectiveStore.resetFields();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Observer(
                  builder: (_) =>
                      CustomMaterialButtom(
                        color: Colors.green,
                        text: 'Salvar',
                        onPressed: objectiveStore.titleValid
                            ? () {
                          objectiveStore.updateTheme();
                          Navigator.pop(context);
                        }
                            : null,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
