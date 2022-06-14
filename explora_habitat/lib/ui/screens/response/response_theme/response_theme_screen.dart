import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/response_objective_store.dart';
import 'package:explora_habitat/services/stores/response_theme_store.dart';
import 'package:explora_habitat/ui/components/google_map/custom_google_map.dart';
import 'package:explora_habitat/ui/screens/response/components/response_objective_component.dart';
import 'package:explora_habitat/ui/widgets/card_theme_details.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ResponseThemeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ResponseThemeStore responseThemeStore =
        Provider.of<ResponseThemeStore>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            responseThemeStore.readOnly
                ? Container()
                : IconButton(
                    onPressed: () {
                      responseThemeStore.saveResponse();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.save),
                  ),
          ],
          title: const Text('Resposta'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.newspaper)),
              Tab(icon: Icon(Icons.map)),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                CardThemeDetails(theme: responseThemeStore.theme),
                Expanded(
                  child: ListView.builder(
                    itemCount: responseThemeStore.theme.objectives.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => Provider(
                      create: (_) => ResponseObjectiveStore(
                        readOnly: responseThemeStore.readOnly,
                        completed: responseThemeStore.completed,
                        objective: responseThemeStore.theme.objectives[index],
                      ),
                      child: ResponseObjectiveComponent(),
                    ),
                  ),
                ),
              ],
            ),
            CustomGoogleMap(),
          ],
        ),
      ),
    );
  }
}
