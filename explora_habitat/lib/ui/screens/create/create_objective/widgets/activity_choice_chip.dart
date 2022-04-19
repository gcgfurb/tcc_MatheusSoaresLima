import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ActivityChoiceChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ActivityStore activityStore = Provider.of<ActivityStore>(context);
    final chips = activityStore.types;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: chips.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Observer(
          builder: (_) => ChoiceChip(
            selectedColor: Colors.green,
            label: Text(chips[index].activityType.getStringValue()),
            selected: chips[index].isSelected,
            onSelected: (bool value) => activityStore.selectAcitivyType(index),
          ),
        ),
      ),
    );
  }
}
