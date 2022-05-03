import 'package:explora_habitat/services/stores/response_objective_store.dart';
import 'package:explora_habitat/ui/screens/response/components/response_activity_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ResponseObjectiveComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ResponseObjectiveStore responseObjectiveStore =
    Provider.of<ResponseObjectiveStore>(context);

    return SingleChildScrollView(
      child: Container(
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
                      responseObjectiveStore.objective.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.pending,
                    color: Colors.green,
                    size: 35,
                  ),
                ],
              ),
              GestureDetector(
                onTap: responseObjectiveStore.toggleExpanded,
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
                        responseObjectiveStore.isExpanded
                            ? Icons.arrow_drop_down_outlined
                            : Icons.arrow_drop_up_outlined,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) => !responseObjectiveStore.isExpanded
                    ? Container()
                    : ResponseActivityStepper()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
