import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/sync_theme_store.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:explora_habitat/ui/widgets/custom_material_button.dart';
import 'package:explora_habitat/ui/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SyncThemeModal extends StatelessWidget {
  SyncThemeStore syncThemeStore = SyncThemeStore();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: kRoundedRectangleBorder,
      elevation: 8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.lightGreen,
              ),
              child: const Text(
                'Sincronizar Tema',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: ErrorIndicator(
                  message: syncThemeStore.syncError,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Observer(
                      builder: (_) => CustomFormField(
                        labelText: "Código",
                        errorText: syncThemeStore.error,
                        inputType: TextInputType.text,
                        onChanged: syncThemeStore.setCode,
                        enabled: !syncThemeStore.loading,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: !syncThemeStore.loading
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MobileScanner(
                                    allowDuplicates: false,
                                    onDetect: (barcode, args) {
                                      if (barcode.rawValue == null) {
                                        debugPrint('Failed to scan Barcode');
                                      } else {
                                        final String code = barcode.rawValue!;
                                        debugPrint('Barcode found! $code');
                                      }
                                    }),
                              ),
                            )
                        : null,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.qr_code,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomMaterialButtom(
                    color: Colors.red,
                    text: 'Cancelar',
                    onPressed: !syncThemeStore.loading
                        ? () => Navigator.pop(context)
                        : null,
                  ),
                ),
                Observer(
                  builder: (_) => CustomMaterialButtom(
                    color: Colors.green,
                    text: 'Sincronizar',
                    onPressed: syncThemeStore.syncTheme,
                    loading: syncThemeStore.loading,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
