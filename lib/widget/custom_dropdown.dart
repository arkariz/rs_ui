import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/widget/custom_text.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.size,
    required this.menuItems,
    required this.onChangeValue,
    required this.label,
    required this.hint,
    this.icon,
    this.value,
  }) : super(key: key);

  final Size size;
  final String? value;
  final String label;
  final String hint;
  final IconData? icon;
  final List<String> menuItems;
  final void Function(String) onChangeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h5(text: label),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: SizedBox(
            width: size.width * 0.85,
            child: DropdownButtonFormField2(
              value: value,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              isExpanded: true,
              hint: Text(
                hint,
                style: const TextStyle(fontSize: 14),
              ),
              icon: Icon(
                icon ?? Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              items: menuItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return hint;
                }
              },
              onChanged: (value) {
                onChangeValue(value.toString());
              },
              onSaved: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
