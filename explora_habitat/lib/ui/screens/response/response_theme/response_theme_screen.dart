import 'package:explora_habitat/services/models/theme.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/response/components/response_objective_component.dart';
import 'package:explora_habitat/ui/widgets/card_theme_details.dart';
import 'package:flutter/material.dart';

class ResponseThemeScreen extends StatelessWidget {
  final ThemeExplora theme;

  ResponseThemeScreen({required this.theme});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
          children: [
            Column(
              children: [
                CardThemeDetails(theme: theme),
                Expanded(
                  child: ListView.builder(
                    itemCount: theme.objectives.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => ResponseObjectiveComponent(
                      objective: theme.objectives[index],
                    ),
                  ),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
