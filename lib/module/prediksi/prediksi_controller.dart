import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/module/prediksi/prediksi_repository.dart';

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

  final repo = PrediksiRepository();

  prediksi() async {
    final body = createRequestBody();
    final result = await repo.getPrediksi(body);
    hasilPrediksi(result.data.prediksi);
    jumlah(result.data.jumlah);
    print(hasilPrediksi.value);
    print(jumlah.value);
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
            : tindakanSekunder1Controller,
        tindakanSekunder2Controller.text.isEmpty
            ? "-"
            : tindakanSekunder2Controller,
        tindakanSekunder3Controller.text.isEmpty
            ? "-"
            : tindakanSekunder3Controller,
      ],
      "subacute": "string",
      "chronic": "string",
      "sp": "string",
      "sr": "string",
      "si": "string",
      "sd": "string"
    };

    return request;
  }
}