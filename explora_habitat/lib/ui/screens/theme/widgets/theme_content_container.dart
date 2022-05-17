import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:flutter/material.dart';

class ThemeContentContainer extends StatelessWidget {
  final ThemeExplora theme;

  ThemeContentContainer(this.theme);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.task_alt_outlined,
                color: Colors.green,
                size: 25,
              ),
              Text(
                _getObjectiveText(theme),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.task_sharp,
                color: Colors.green,
                size: 25,
              ),
              Text(
                _getActivityText(theme),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(
                Icons.person_pin,
                color: darkerGreen,
                size: 35,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mediador',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    theme.creator!.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  String _getObjectiveText(ThemeExplora theme) {
    return theme.objectives.length == 1
        ? '1 Objetivo'
        : '${theme.objectives.length} Objetivos';
  }

  String _getActivityText(ThemeExplora theme) {
    final int activitiesSize = theme.objectives
        .map((Objective objective) => objective.activities.length)
        .fold(0, (num1, num2) => num1 + num2);

    return activitiesSize == 1 ? '1 Atividade' : '$activitiesSize Atividades';
  }
}
