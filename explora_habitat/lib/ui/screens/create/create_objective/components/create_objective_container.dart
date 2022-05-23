import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/stores/create_activity_store.dart';
import 'package:explora_habitat/services/stores/objective_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/components/activities_container.dart';
import 'package:explora_habitat/ui/widgets/update_objective_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateObjectiveContainer extends StatelessWidget {
  final Objective objective;
  final Function()? onRemove;
  final bool readOnly;

  CreateObjectiveContainer({
    required this.objective,
    required this.onRemove,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    ObjectiveStore objectiveStore = ObjectiveStore(objective);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) => Flexible(
                    child: Text(
                      objectiveStore.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                !readOnly
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () => showDialog(
                              context: context,
                              builder: (_) =>
                                  UpdateObjectiveModal(objectiveStore),
                            ),
                            child: Ink(
                              child: const Icon(
                                Icons.edit,
                                color: darkGreen,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: onRemove,
                            child: Ink(
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Provider(
                  create: (_) => CreateActivityStore(
                    objectiveStore.objective.activities,
                    objectiveStore.objective,
                  ),
                  child: ActivitiesContainer(
                    objective: objectiveStore.objective,
                    readOnly: readOnly,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
