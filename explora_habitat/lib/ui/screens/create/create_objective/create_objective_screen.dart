import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/services/stores/page_store.dart';
import 'package:explora_habitat/ui/screens/base/base_screen.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/components/create_objective_container.dart';
import 'package:explora_habitat/ui/screens/create/create_theme/components/custom_elevated_button.dart';
import 'package:explora_habitat/ui/widgets/card_theme_details.dart';
import 'package:explora_habitat/ui/widgets/custom_alert_dialog.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:explora_habitat/ui/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
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

    void saveTheme() {
      createThemeStore.setObjectives(createObjetivoStore.objectives);
      createThemeStore.saveTheme();
      if (createThemeStore.themeContentError == null) {
        GetIt.I<PageStore>().setPage(0);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BaseScreen(),
            ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicione objetivos'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: saveTheme,
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
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: ErrorIndicator(
                      message: createThemeStore.themeContentError,
                    ),
                  ),
                ),
                CardThemeDetails(
                  theme: theme,
                  editing: true,
                ),
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
                    onRemove: () async {
                      var objective = createObjetivoStore.objectives[index];
                      if (objective.activities.isNotEmpty) {
                        await showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: 'Exclusão de objetivo',
                            body: const Text(
                              'Deseja excluir um objetivo com atividades cadastradas?',
                              style: TextStyle(fontSize: 18),
                            ),
                            onSave: () {
                              createObjetivoStore.removeItem(index);
                              Navigator.pop(context);
                            },
                            onCancel: () => Navigator.pop(context),
                          ),
                        );
                      } else {
                        createObjetivoStore.removeItem(index);
                      }
                    },
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
