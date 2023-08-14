import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rs_ui/helper/size_config.dart';
import 'package:rs_ui/module/prediksi_lama_rawat/prediksi_lama_rawat_controller.dart';
import 'package:rs_ui/widget/custom_dropdown.dart';
import 'package:rs_ui/widget/custom_text.dart';
import 'package:rs_ui/widget/custom_text_field.dart';

class PrediksiLamaRawatScreen extends GetView<PrediksiLamaRawatController> {
  const PrediksiLamaRawatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h1(text: "Prediksi Lama Rawat"),
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
                child: Form(
                  key: controller.keyForm,
                  child: Column(
                    children: [
                      diagnosisForm(),
                      const SizedBox(height: 20),
                      tindakanForm(),
                      const SizedBox(height: 20),
                      biodataForm(size),
                      SizedBox(
                        height: 45,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.prediksi();
                          },
                          child: Text("Prediksi"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget diagnosisForm() {
    return Column(
      children: [
        CustomTextField(
          label: "Diagnosis Primer",
          hint: "Masukkan kode diagnosis primer",
          controller: controller.diagnosisPrimerController,
          customValidator: true,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Diagnosis Sekunder",
          hint: "Masukkan kode diagnosis sekunder 1 (Opsional)",
          controller: controller.diagnosisSekunder1Controller,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hint: "Masukkan kode diagnosis sekunder 2 (Opsional)",
          controller: controller.diagnosisSekunder2Controller,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hint: "Masukkan kode diagnosis sekunder 3 (Opsional)",
          controller: controller.diagnosisSekunder3Controller,
        ),
      ],
    );
  }

  Widget tindakanForm() {
    return Column(
      children: [
        CustomTextField(
          label: "Tindakan Primer",
          hint: "Masukkan kode tindakan primer",
          controller: controller.tindakanPrimerController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Tindakan Sekunder",
          hint: "Masukkan kode tindakan sekunder 1 (Opsional)",
          controller: controller.tindakanSekunder1Controller,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hint: "Masukkan kode tindakan sekunder 2 (Opsional)",
          controller: controller.tindakanSekunder2Controller,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hint: "Masukkan kode tindakan sekunder 3 (Opsional)",
          controller: controller.tindakanSekunder3Controller,
        ),
      ],
    );
  }

  Widget biodataForm(Size size) {
    return Column(
      children: [
        CustomTextField(
          label: "Umur",
          hint: "Masukkan umur",
          controller: controller.umur,
          inputType: TextInputType.number,
          customValidator: true,
        ),
        const SizedBox(height: 15),
        CustomDropdown(
          size: size,
          menuItems: controller.genderList,
          onChangeValue: controller.onSelectedGender,
          label: "Jenis Kelamin",
          hint: "Pilih jenis kelamin",
        ),
        CustomDropdown(
          size: size,
          menuItems: controller.hariList,
          onChangeValue: controller.onSelectedHari,
          label: "Hari Masuk Pasien",
          hint: "Pilih hari",
        ),
        CustomDropdown(
          size: size,
          menuItems: controller.severityList,
          onChangeValue: controller.onSelectedSeverity,
          label: "Severity Level",
          hint: "Pilih severity level",
        ),
      ],
    );
  }
}
