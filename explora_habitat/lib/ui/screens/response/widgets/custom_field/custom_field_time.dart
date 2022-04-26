import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFieldTime extends StatelessWidget {
  final CustomField customField;

  const CustomFieldTime(this.customField);

  @override
  Widget build(BuildContext context) {
    final DateTime value = customField.value != null &&
        DateTime.tryParse(customField.value) != null
        ? DateTime.parse(customField.value)
        : DateTime.now();

    TimeOfDay initialValue = TimeOfDay.fromDateTime(value);

    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            enabled: false,
            labelText: customField.title,
            inputType: TextInputType.text,
            errorText: null,
            initialValue: DateFormat("HH:mm").format(value),
            onChanged: (value) {},
          ),
        ),
        IconButton(
          icon: const Icon(Icons.timer_outlined),
          color: darkGreen,
          onPressed: () async {
            var time = await showTimePicker(
              confirmText: 'CONFIRMAR',
              cancelText: 'CANCELAR',
              context: context,
              initialTime: initialValue,
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
          },
        ),
      ],
    );
  }
}
