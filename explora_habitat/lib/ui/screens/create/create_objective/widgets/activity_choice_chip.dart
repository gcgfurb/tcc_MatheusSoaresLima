import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:explora_habitat/services/enum/activity_type.dart';

class ActivityChoiceChip extends StatelessWidget {
  final bool readOnly;

  ActivityChoiceChip({this.readOnly = false});

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
            label: Text(chips[index].activityType.description),
            selected: chips[index].isSelected,
            onSelected: !readOnly
                ? (bool value) => activityStore.selectAcitivyType(index)
                : null,
          ),
        ),
      ),
    );
  }
}
