import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rs_ui/helper/size_config.dart';
import 'package:rs_ui/widget/custom_text.dart';
import 'package:rs_ui/widget/custom_text_field.dart';

class PrediksiScreen extends GetView {
  const PrediksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h1(text: "Prediksi"),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              height: SizeConfig(context).getHeight() * 0.85,
              width: SizeConfig(context).getWidth(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      label: "Diagnosis Primer",
                      controller: TextEditingController(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
