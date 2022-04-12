import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/objetivo.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:explora_habitat/services/stores/create_activity_store.dart';
import 'package:explora_habitat/ui/screens/create_objective/components/create_activity_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ActivitiesStepper extends StatelessWidget {
  final Objective objective;

  ActivitiesStepper({required this.objective});

  @override
  Widget build(BuildContext context) {
    final CreateActivityStore createActivityStore =
        Provider.of<CreateActivityStore>(context);

    return Column(
      children: [
        GestureDetector(
          onTap: createActivityStore.toggleExpanded,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Atividades',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Observer(
                builder: (_) => Icon(
                  createActivityStore.isExpanded
                      ? Icons.arrow_drop_down_outlined
                      : Icons.arrow_drop_up_outlined,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => !createActivityStore.isExpanded
              ? Container()
              : Column(
                  children: [
                    createActivityStore.activities.isEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: 200,
                            height: 100,
                            child: Center(
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.not_interested_outlined,
                                    color: Colors.teal,
                                    size: 40,
                                  ),
                                  Text(
                                    'Você não adicionou atividades a este objetivo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.teal, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Stepper(
                            currentStep: 0,
                            controlsBuilder: (context, controlsDetails) =>
                                const SizedBox(),
                            onStepTapped: (int index) {},
                            steps: <Step>[
                              Step(
                                title: const Text('Step 1 title'),
                                content: Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text('Content for Step 1')),
                              ),
                              const Step(
                                title: Text('Step 2 title'),
                                content: Text('Content for Step 2'),
                              ),
                            ],
                          ),
                    MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => Provider(
                            create: (_) =>
                                ActivityStore(activity: Activity(title: '', types: [], customFields: [])),
                            child: CreateActivityModal(),
                          ),
                        );
                      },
                      color: Colors.green,
                      shape: kRoundedRectangleBorder,
                      child: const Text(
                        '+ Adicionar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
