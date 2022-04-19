import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/create_objective_screen.dart';
import 'package:explora_habitat/ui/screens/create/create_theme/components/custom_elevated_button.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateThemeScreen extends StatelessWidget {
  final CreateThemeStore createThemeStore = CreateThemeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar tema'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Card(
                elevation: 8,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                clipBehavior: Clip.antiAlias,
                shape: kRoundedRectangleBorder,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Observer(
                            builder: (_) => CustomFormField(
                              labelText: 'Título',
                              errorText: createThemeStore.titleError,
                              inputType: TextInputType.text,
                              onChanged: createThemeStore.setTitle,
                            ),
                          ),
                          Observer(
                            builder: (_) => CustomFormField(
                              labelText: 'Descrição',
                              errorText: createThemeStore.descriptionError,
                              inputType: TextInputType.text,
                              onChanged: createThemeStore.setDescription,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Observer(
                builder: (_) => CustomElevatedButton(
                  icon: Icons.arrow_forward,
                  onPressed: createThemeStore.themeValid
                      ? () {
                          createThemeStore.setTheme();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Provider(
                                create: (_) => CreateObjectiveStore(),
                                child: CreateObjetivoScreen(
                                  createThemeStore: createThemeStore,
                                ),
                              ),
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
