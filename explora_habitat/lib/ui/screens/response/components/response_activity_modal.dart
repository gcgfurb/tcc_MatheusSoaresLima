import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/helpers/geolocator_manager.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/stores/response_activity_store.dart';
import 'package:explora_habitat/ui/screens/response/widgets/activity_resources.dart';
import 'package:explora_habitat/ui/screens/response/widgets/custom_activity_field.dart';
import 'package:explora_habitat/ui/widgets/custom_material_button.dart';
import 'package:explora_habitat/ui/widgets/text_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ResponseActivityModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResponseActivityStore responseActivityStore =
        Provider.of<ResponseActivityStore>(context);

    final Activity activity = responseActivityStore.activity;

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
              child: Text(
                activity.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                  Row(
                    children: const [
                      TextLabel(
                        'Recursos',
                        color: Colors.teal,
                      ),
                      Divider(
                        color: Colors.teal,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: activity.types.length,
                      itemBuilder: (_, index) =>
                          ActivityResources(activity.types[index]),
                    ),
                  ),
                  Row(
                    children: const [
                      TextLabel(
                        'Perguntas',
                        color: Colors.teal,
                      ),
                      Divider(
                        color: Colors.teal,
                        thickness: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: responseActivityStore.customFields.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => CustomActivityField(
                        responseActivityStore.customFields[index],
                      ),
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
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Observer(
                        builder: (_) => CustomMaterialButtom(
                          color: Colors.green,
                          text: 'Confirmar',
                          loading: responseActivityStore.loading,
                          onPressed: () async {
                            await responseActivityStore.saveResponse();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
