import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/stores/create_activity_store.dart';
import 'package:explora_habitat/services/stores/objective_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/components/activities_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateObjectiveContainer extends StatelessWidget {
  final Objective objective;
  final Function()? onRemove;

  CreateObjectiveContainer({required this.objective, required this.onRemove});

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
                Flexible(
                  child: Text(
                    objectiveStore.objective.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
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
                ),
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
