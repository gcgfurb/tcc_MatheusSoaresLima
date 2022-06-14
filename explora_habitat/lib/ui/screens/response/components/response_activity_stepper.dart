import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
import 'package:explora_habitat/services/stores/response_activity_store.dart';
import 'package:explora_habitat/services/stores/response_objective_store.dart';
import 'package:explora_habitat/services/stores/response_theme_store.dart';
import 'package:explora_habitat/ui/screens/response/components/response_activity_modal.dart';
import 'package:explora_habitat/ui/screens/response/components/responses_activity_list_view.dart';
import 'package:explora_habitat/ui/widgets/acitivity_container_details.dart';
import 'package:explora_habitat/ui/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ResponseActivityStepper extends StatefulWidget {
  @override
  State<ResponseActivityStepper> createState() =>
      _ResponseActivityStepperState();
}

class _ResponseActivityStepperState extends State<ResponseActivityStepper> {
  @override
  Widget build(BuildContext context) {
    final ResponseObjectiveStore responseObjectiveStore =
        Provider.of<ResponseObjectiveStore>(context);

    void initActivity() {
      final step = responseObjectiveStore.currentStep;
      final activity = responseObjectiveStore.objective.activities[step];
      showDialog(
        context: context,
        builder: (_) => Provider(
          create: (_) => ResponseActivityStore(activity,
              readOnly: responseObjectiveStore.readOnly),
          child: ResponseActivityModal(),
        ),
      );
    }
    return Column(
      children: [
        Observer(
          builder: (_) => Stepper(
            currentStep: responseObjectiveStore.currentStep,
            onStepTapped: responseObjectiveStore.setCurrentStep,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Container();
            },
            steps: responseObjectiveStore.objective.activities
                .map(
                  (activity) => Step(
                    state: activity.status == ActivityStatus.pending
                        ? StepState.indexed
                        : StepState.complete,
                    title: Text(
                      activity.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AcitivityContainerDetails(
                                activity,
                              ),
                            ),
                            responseObjectiveStore.completed
                                ? Container()
                                : Observer(
                                    builder: (_) =>
                                        !responseObjectiveStore.readOnly
                                            ? CustomMaterialButtom(
                                                onPressed:
                                                    responseObjectiveStore
                                                            .canInitAcitivity
                                                        ? initActivity
                                                        : null,
                                                text: 'Responder',
                                                color: Colors.orange,
                                              )
                                            : CustomMaterialButtom(
                                                onPressed: initActivity,
                                                text: 'Respostas',
                                                color: Colors.green,
                                              ),
                                  ),
                          ],
                        ),
                        responseObjectiveStore.completed
                            ? ResponseActivityListView(activity: activity)
                            : Container(),
                        //PositionAcitivityDetails(activity),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
