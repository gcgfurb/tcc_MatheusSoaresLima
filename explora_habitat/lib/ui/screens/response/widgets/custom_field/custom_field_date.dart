import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFieldDate extends StatelessWidget {
  final CustomField customField;

  CustomFieldDate(this.customField);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateTime initialValue = customField.value ?? DateTime.now();
    _textEditingController.text = DateFormat('dd/MM/yyyy').format(initialValue);

    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            enabled: false,
            labelText: customField.title,
            inputType: TextInputType.text,
            errorText: null,
            controller: _textEditingController,
            onChanged: (value) {},
          ),
        ),
        IconButton(
          icon: const Icon(Icons.date_range),
          color: darkGreen,
          onPressed: () async {
            var date = await showDatePicker(
              confirmText: 'CONFIRMAR',
              cancelText: 'CANCELAR',
              context: context,
              initialDate: initialValue,
              firstDate: initialValue.subtract(const Duration(days: 30)),
              lastDate: initialValue.add(const Duration(days: 30)),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Colors.lightGreen, // header background color
                      onPrimary: Colors.white, // header text color
                      onSurface: Colors.black, // body text color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: darkGreen, // button text color
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (date != null) {
              customField.value = date;
              _textEditingController.value =
                  TextEditingValue(text: DateFormat('dd/MM/yyyy').format(date));
            }
          },
        ),
      ],
    );
  }
}
