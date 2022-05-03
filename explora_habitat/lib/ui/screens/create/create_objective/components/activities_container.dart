import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:explora_habitat/services/stores/create_activity_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/components/create_activity_modal.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/widgets/custom_reorderable_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ActivitiesContainer extends StatelessWidget {
  final Objective objective;

  ActivitiesContainer({required this.objective});

  @override
  Widget build(BuildContext context) {
    final CreateActivityStore createActivityStore =
        Provider.of<CreateActivityStore>(context);

    return Expanded(
      child: Column(
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
                          ? const EmptyActivitiesContainer()
                          : CustomReorderableListView(),
                      createActivityStore.activities.isEmpty
                          ? Container()
                          : Observer(
                              builder: (_) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: createActivityStore.keepOrder,
                                    onChanged: (value) {
                                      createActivityStore.toggleKeepOrder();
                                      objective.keepOrder =
                                          createActivityStore.keepOrder;
                                    },
                                  ),
                                  const Text(
                                      'Realizar atividades na ordem proposta')
                                ],
                              ),
                            ),
                      MaterialButton(
                        onPressed: () => _showAddActivityDialog(
                            context, createActivityStore),
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
      ),
    );
  }

  void _showAddActivityDialog(
      BuildContext context, CreateActivityStore createActivityStore) async {
    Activity? activity = await showDialog(
      context: context,
      builder: (_) => Provider(
        create: (_) => ActivityStore(
            activity: Activity(title: '', types: [], customFields: [])),
        child: CreateActivityModal(),
      ),
    );
    if (activity != null) {
      createActivityStore.activities.add(activity);
      objective.activities = createActivityStore.activities;
    }
  }
}

class EmptyActivitiesContainer extends StatelessWidget {
  const EmptyActivitiesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: TextStyle(color: Colors.teal, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
