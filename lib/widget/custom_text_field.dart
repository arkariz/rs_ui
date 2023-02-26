import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rs_ui/widget/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.inputType = TextInputType.text,
    required this.hint,
    required this.controller,
  });

  final String? label;
  final TextInputType inputType;
  final String hint;
  final TextEditingController controller;

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
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
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
          ),
          onChanged: (value) {
            controller.text = value;
          },
        )
      ],
    );
  }
}
