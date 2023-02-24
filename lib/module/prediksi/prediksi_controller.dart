import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/module/prediksi/prediksi_repository.dart';
import 'package:rs_ui/widget/currency_formatter.dart';
import 'package:rs_ui/widget/custom_text.dart';
import 'package:rs_ui/widget/loading/loading_controller.dart';

class PrediksiController extends GetxController {
  final diagnosisPrimerController = TextEditingController();
  final diagnosisSekunder1Controller = TextEditingController();
  final diagnosisSekunder2Controller = TextEditingController();
  final diagnosisSekunder3Controller = TextEditingController();
  final tindakanPrimerController = TextEditingController();
  final tindakanSekunder1Controller = TextEditingController();
  final tindakanSekunder2Controller = TextEditingController();
  final tindakanSekunder3Controller = TextEditingController();
  final subacuteController = TextEditingController();
  final chronicController = TextEditingController();
  final spController = TextEditingController();
  final srController = TextEditingController();
  final siController = TextEditingController();
  final sdController = TextEditingController();

  final hasilPrediksi = "".obs;
  final jumlah = "".obs;
  final tarifRs = "".obs;
  final tarifInacbg = "".obs;
  final isLoading = false.obs;

  final repo = PrediksiRepository();
  final loading = Get.find<LoadingController>();

  prediksi() async {
    loading.isLoading = true;
    final body = createRequestBody();
    final result = await repo.getPrediksi(body);
    if (result != null) {
      hasilPrediksi(result.data.prediksi);
      jumlah.value = CurrencyFormatter.toIdr(result.data.jumlah);
      tarifRs.value = CurrencyFormatter.toIdr(result.data.tarifRs);
      tarifInacbg.value = CurrencyFormatter.toIdr(result.data.tarifInacbg);
      loading.isLoading = false;
      showDialog();
    }
    loading.isLoading = false;
  }

  createRequestBody() {
    final Map<String, dynamic> request = {
      "diagnosis": [
        diagnosisPrimerController.text,
        diagnosisSekunder1Controller.text.isEmpty
            ? "-"
            : diagnosisSekunder1Controller.text,
        diagnosisSekunder2Controller.text.isEmpty
            ? "-"
            : diagnosisSekunder2Controller.text,
        diagnosisSekunder3Controller.text.isEmpty
            ? "-"
            : diagnosisSekunder3Controller.text,
      ],
      "tindakan": [
        tindakanPrimerController.text.isEmpty
            ? "-"
            : tindakanPrimerController.text,
        tindakanSekunder1Controller.text.isEmpty
            ? "-"
            : tindakanSekunder1Controller.text,
        tindakanSekunder2Controller.text.isEmpty
            ? "-"
            : tindakanSekunder2Controller.text,
        tindakanSekunder3Controller.text.isEmpty
            ? "-"
            : tindakanSekunder3Controller.text,
      ],
      "subacute":
          subacuteController.text.isEmpty ? "-" : subacuteController.text,
      "chronic": chronicController.text.isEmpty ? "-" : chronicController.text,
      "sp": spController.text.isEmpty ? "-" : spController.text,
      "sr": srController.text.isEmpty ? "-" : srController.text,
      "si": siController.text.isEmpty ? "-" : siController.text,
      "sd": sdController.text.isEmpty ? "-" : sdController.text,
    };

    return request;
  }

  showDialog() {
    Get.defaultDialog(
      title: "Hasil Prediksi",
      titlePadding: const EdgeInsets.only(top: 24),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          h4(text: hasilPrediksi.value.capitalizeFirst!),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h5(text: "Rata-rata tarif rumah sakit"),
                  h5(text: "Tarif INA-CBG"),
                  h5(text: "Total ke${hasilPrediksi.value.toLowerCase()}an"),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h5(text: tarifRs.value),
                  h5(text: tarifInacbg.value),
                  h5(text: jumlah.value),
                ],
              )
            ],
          ),
        ],
      ),
      confirm: SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Ok"),
        ),
      ),
    );
  }
}
