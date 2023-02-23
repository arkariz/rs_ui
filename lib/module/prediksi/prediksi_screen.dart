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
                    Row(
                      children: [
                        diagnosisForm(),
                        const SizedBox(width: 30),
                        tindakanForm(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    specialForm(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Flexible diagnosisForm() {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          CustomTextField(
            label: "Diagnosis Primer",
            hint: "Masukkan kode diagnosis primer",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Diagnosis Sekunder",
            hint: "Masukkan kode diagnosis sekunder 1 (Opsional)",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hint: "Masukkan kode diagnosis sekunder 2 (Opsional)",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hint: "Masukkan kode diagnosis sekunder 3 (Opsional)",
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  Flexible tindakanForm() {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          CustomTextField(
            label: "Tindakan Primer",
            hint: "Masukkan kode tindakan primer",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Tindakan Sekunder",
            hint: "Masukkan kode tindakan sekunder 1 (Opsional)",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hint: "Masukkan kode tindakan sekunder 2 (Opsional)",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hint: "Masukkan kode tindakan sekunder 3 (Opsional)",
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget specialForm() {
    return Column(
      children: [
        CustomTextField(
          label: "Subacute",
          hint: "Masukkan kode subacute (Opsional)",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Chronic",
          hint: "Masukkan kode chronic (Opsional)",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special Procedure",
          hint: "Masukkan kode special procedure (Opsional)",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special Drug",
          hint: "Masukkan kode special drug (Opsional)",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special investigation",
          hint: "Masukkan kode special Investigation (Opsional)",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special Prothesis",
          hint: "Masukkan kode special prothesis (Opsional)",
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
