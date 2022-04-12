import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/create_activity_store.dart';
import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/ui/screens/create_objective/widgets/activities_stepper.dart';
import 'package:explora_habitat/ui/screens/create_theme/components/custom_elevated_button.dart';
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
    final CreateObjectiveStore createObjetivoStore =
        Provider.of<CreateObjectiveStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicione objetivos'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Column(
              children: [
                Card(
                  elevation: 8,
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  shape: kRoundedRectangleBorder,
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const Icon(
                          Icons.newspaper,
                          size: 35,
                        ),
                        title: Text(
                          createThemeStore.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                        subtitle: Text(createThemeStore.description!),
                      )),
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
                  itemBuilder: (_, index) => Container(
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
                                  createObjetivoStore.objectives[index].title,
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
                                    onTap: () =>
                                        createObjetivoStore.removeItem(index),
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
                                create: (_) => CreateActivityStore(),
                                child: ActivitiesStepper(
                              objective:
                                  createObjetivoStore.objectives[index],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
