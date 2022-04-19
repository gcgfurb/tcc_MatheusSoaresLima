import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/theme.dart';
import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/ui/screens/base/base_screen.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/components/create_objective_container.dart';
import 'package:explora_habitat/ui/screens/create/create_theme/components/custom_elevated_button.dart';
import 'package:explora_habitat/ui/widgets/card_theme_details.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateObjetivoScreen extends StatelessWidget {
  final CreateThemeStore createThemeStore;
  final TextEditingController _textEditingController = TextEditingController();

  CreateObjetivoScreen({required this.createThemeStore});

  @override
  Widget build(BuildContext context) {
    final ThemeExplora theme = createThemeStore.theme!;
    final CreateObjectiveStore createObjetivoStore =
        Provider.of<CreateObjectiveStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicione objetivos'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                createThemeStore.setObjectives(createObjetivoStore.objectives);
                createThemeStore.saveTheme();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BaseScreen(),
                  ),
                );
              },
              child: Ink(
                child: const Icon(
                  Icons.save,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Column(
              children: [
                CardThemeDetails(theme: theme),
                Card(
                  elevation: 8,
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  shape: kRoundedRectangleBorder,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Observer(
                                builder: (_) => CustomFormField(
                                  controller: _textEditingController,
                                  labelText: 'Novo Objetivo',
                                  textColor: Colors.black,
                                  errorText: null,
                                  inputType: TextInputType.text,
                                  onChanged: createObjetivoStore.setTitle,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => CustomElevatedButton(
                                icon: Icons.add_task,
                                iconSize: 20,
                                onPressed: !createObjetivoStore.titleValid
                                    ? null
                                    : () {
                                        createObjetivoStore.addNewItem();
                                        _textEditingController.clear();
                                      },
                                size: const Size(40, 40),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Observer(
              builder: (_) => Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: createObjetivoStore.objectives.length,
                  itemBuilder: (_, index) => CreateObjectiveContainer(
                    objective: createObjetivoStore.objectives[index],
                    onRemove: () => createObjetivoStore.removeItem(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
