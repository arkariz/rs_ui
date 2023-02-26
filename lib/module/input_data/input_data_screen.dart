import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rs_ui/helper/size_config.dart';
import 'package:rs_ui/module/input_data/input_data_controller.dart';
import 'package:rs_ui/widget/custom_text.dart';
import 'package:rs_ui/widget/custom_text_field.dart';

class InputDataScreen extends GetView<InputDataController> {
  const InputDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h1(text: "Input Data"),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    biodataForm(),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        diagnosisForm(),
                        const SizedBox(width: 30),
                        tindakanForm(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    specialForm(),
                    const SizedBox(height: 30),
                    h2(text: "Tarif"),
                    const SizedBox(height: 20),
                    tarifForm(),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: SizeConfig(context).getWidth(),
                      child: Center(
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.prediksi();
                            },
                            child: Text("Submit"),
                          ),
                        ),
                      ),
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

  Widget biodataForm() {
    return Column(
      children: [
        CustomTextField(
          label: "Nomor KTP",
          hint: "Masukkan nomor KTP",
          controller: controller.ktpController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Kelas Rawat",
          hint: "Masukkan kelas rawat",
          controller: controller.kelasRawatController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Jenis Kelamin",
          hint: "Masukkan jenis kelamin",
          controller: controller.kelaminController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Lama dirawat",
          hint: "Masukkan jumlah hari lama dirawat",
          controller: controller.lamaDirawatController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Umur",
          hint: "Masukkan umur",
          controller: controller.umurController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Code INACBG",
          hint: "Masukkan code INACBG",
          controller: controller.codeInacbgController,
        ),
      ],
    );
  }

  Widget tarifForm() {
    return Column(
      children: [
        CustomTextField(
          label: "Tarif INACBG",
          hint: "Masukkan Tarif INACBG",
          controller: controller.tarifInacbgController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Tarif Rumah Sakit",
          hint: "Masukkan tarif rumah sakit",
          controller: controller.tarifRsController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Prosedur Non Bedah",
          hint: "Masukkan tarif prosedur non bedah",
          controller: controller.tarifNonbedahController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Prosedur Bedah",
          hint: "Masukkan tarif prosedur bedah",
          controller: controller.tarifBedahController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Konsultasi",
          hint: "Masukkan tarif konsultasi",
          controller: controller.tarifKonsultasiController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Tenaga Ahli",
          hint: "Masukkan tarif tenaga ahli",
          controller: controller.tarifTenagaAhliController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Keperawatan",
          hint: "Masukkan tarif keperawatan",
          controller: controller.tarifKeperawatanController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Penunjang",
          hint: "Masukkan tarif penunjang",
          controller: controller.tarifPenunjangController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Radiologi",
          hint: "Masukkan tarif radiologi",
          controller: controller.tarifRadiologiController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Laboratorium",
          hint: "Masukkan tarif laboratorium",
          controller: controller.tarifLabController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Pelayanan Darah",
          hint: "Masukkan tarif pelayanan darah",
          controller: controller.tarifDarahController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Rehabilitasi",
          hint: "Masukkan tarif rehabilitasi",
          controller: controller.tarifRehabController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Kamar Akomodasi",
          hint: "Masukkan tarif kamar akomodasi",
          controller: controller.tarifKamarAkomodasiController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Rawat Intensif",
          hint: "Masukkan tarif rawat intensif",
          controller: controller.tarifRawatIntensifController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Obat",
          hint: "Masukkan tarif obat",
          controller: controller.tarifObatController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Alkes",
          hint: "Masukkan tarif alkes",
          controller: controller.tarifAlkesController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "BMHP",
          hint: "Masukkan tarif BMHP",
          controller: controller.tarifBMHPController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Sewa Alat",
          hint: "Masukkan tarif sewa alat",
          controller: controller.tarifSewaAlatController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Obat Kronis",
          hint: "Masukkan tarif obat kronis",
          controller: controller.tarifObatKronisController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Obat Kemo",
          hint: "Masukkan tarif obat kemo",
          controller: controller.tarifObatKemoController,
        ),
      ],
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
            controller: controller.diagnosisPrimerController,
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
            hint: "Masukkan kode tindakan primer (Opsional)",
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
      ),
    );
  }

  Widget specialForm() {
    return Column(
      children: [
        CustomTextField(
          label: "Subacute",
          hint: "Masukkan kode subacute (Opsional)",
          controller: controller.subacuteController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Chronic",
          hint: "Masukkan kode chronic (Opsional)",
          controller: controller.chronicController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special Procedure",
          hint: "Masukkan kode special procedure (Opsional)",
          controller: controller.spController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special Drug",
          hint: "Masukkan kode special drug (Opsional)",
          controller: controller.sdController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special investigation",
          hint: "Masukkan kode special Investigation (Opsional)",
          controller: controller.siController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          label: "Special Prothesis",
          hint: "Masukkan kode special prothesis (Opsional)",
          controller: controller.srController,
        ),
      ],
    );
  }
}
