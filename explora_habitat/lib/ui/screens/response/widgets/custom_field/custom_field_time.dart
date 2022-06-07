import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFieldTime extends StatelessWidget {
  final CustomField customField;
  final TextEditingController _textEditingController = TextEditingController();

  CustomFieldTime(this.customField);

  @override
  Widget build(BuildContext context) {
    TimeOfDay initialValue = getTime(customField.value);

    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            enabled: false,
            labelText: customField.title,
            inputType: TextInputType.text,
            errorText: null,
            controller: _textEditingController,
            onChanged: (value) => customField.value = value,
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
            if (time != null) {
              customField.value = getTime(time);
              final now = DateTime.now();
              final dt = DateTime(
                  now.year, now.month, now.day, time.hour, time.minute);
              _textEditingController.value =
                  TextEditingValue(text: DateFormat("HH:mm").format(dt));
            }
          },
        ),
      ],
    );
  }

  TimeOfDay getTime(TimeOfDay? value) {
    var initialValue = value ?? TimeOfDay.fromDateTime(DateTime.now());
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, initialValue.hour, initialValue.minute);
    _textEditingController.value =
        TextEditingValue(text: DateFormat("HH:mm").format(dt));
    return initialValue;
  }
}
