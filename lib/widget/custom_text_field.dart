import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rs_ui/widget/custom_text.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.label,
    this.inputType = TextInputType.text,
    required this.hint,
    required this.controller,
    this.customValidator,
    this.isCurrency = false,
  });

  final String? label;
  final TextInputType inputType;
  final String hint;
  final TextEditingController controller;
  final bool? customValidator;
  final bool isCurrency;
  final formatter = CurrencyTextInputFormatter(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp. ',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) h5(text: label!),
        if (label != null) const SizedBox(height: 7),
        TextFormField(
          keyboardType: inputType,
          inputFormatters: inputType == TextInputType.number
              ? isCurrency == true
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                      formatter
                    ]
                  : <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
              : null,
          decoration: InputDecoration(
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red.shade300,
              ),
            ),
          ),
          validator: ((value) {
            if (customValidator != null) {
              if (value!.isEmpty || value == null) {
                return "Kolom tidak boleh kosong";
              } else {
                return null;
              }
            } else {
              return null;
            }
          }),
          onChanged: (value) {
            controller.text = isCurrency == true
                ? formatter.getUnformattedValue().toString()
                : value;
          },
        )
      ],
    );
  }
}
