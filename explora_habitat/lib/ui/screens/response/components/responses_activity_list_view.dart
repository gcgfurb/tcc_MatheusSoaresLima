import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
import 'package:explora_habitat/services/stores/response_activity_store.dart';
import 'package:explora_habitat/ui/screens/response/components/response_activity_modal.dart';
import 'package:explora_habitat/ui/widgets/empty_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponseActivityListView extends StatelessWidget {
  final Activity activity;

  ResponseActivityListView({required this.activity});

  @override
  Widget build(BuildContext context) {
    void openResponse(ResponseActivity responseActivity) {
      showDialog(
        context: context,
        builder: (_) => Provider(
          create: (_) => ResponseActivityStore(activity, readOnly: true, response: responseActivity),
          child: ResponseActivityModal(),
        ),
      );
    }
    return activity.responsesActivity.isEmpty
        ? EmptyContainer("Não houve envio de respostas para esta atividade")
        : ListView.builder(
            shrinkWrap: true,
            itemCount: activity.responsesActivity.length,
            itemBuilder: (_, index) => Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.person_pin,
                  color: darkerGreen,
                  size: 35,
                ),
                title: Text(activity.responsesActivity[index].user!.name),
                subtitle: const Text("Clubista"),
                trailing: CircleAvatar(
                  backgroundColor: Colors.greenAccent.withAlpha(120),
                  child: IconButton(
                    icon: const Icon(Icons.question_answer),
                    color: Colors.green,
                    onPressed: () =>
                        openResponse(activity.responsesActivity[index]),
                  ),
                ),
              ),
            ),
          );
  }
}
