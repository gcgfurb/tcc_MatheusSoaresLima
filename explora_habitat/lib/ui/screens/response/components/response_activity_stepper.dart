import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/stores/response_activity_store.dart';
import 'package:explora_habitat/services/stores/response_objective_store.dart';
import 'package:explora_habitat/ui/screens/response/components/response_activity_modal.dart';
import 'package:explora_habitat/ui/screens/response/widgets/position_activity_details.dart';
import 'package:explora_habitat/ui/widgets/acitivity_container_details.dart';
import 'package:explora_habitat/ui/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ResponseActivityStepper extends StatelessWidget {
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
          create: (_) => ResponseActivityStore(activity),
          child: ResponseActivityModal(),
        ),
      );
    }

    Widget getActivityButton() {
      final step = responseObjectiveStore.currentStep;
      final activity = responseObjectiveStore.objective.activities[step];
      return activity.activityStatus == ActivityStatus.pending
          ? CustomMaterialButtom(
              onPressed:
                  responseObjectiveStore.canInitAcitivity ? initActivity : null,
              text: 'Iniciar',
              color: Colors.orange,
            )
          : CustomMaterialButtom(
              onPressed: () {},
              text: 'Respostas',
              color: Colors.green,
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
                    state: activity.activityStatus == ActivityStatus.pending
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
                            getActivityButton(),
                          ],
                        ),
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
