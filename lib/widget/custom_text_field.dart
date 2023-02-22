import 'package:flutter/material.dart';
import 'package:rs_ui/widget/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h5(text: label),
        const SizedBox(height: 7),
        TextField(
          controller: controller,
          decoration: InputDecoration(
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
        )
      ],
    );
  }
}
