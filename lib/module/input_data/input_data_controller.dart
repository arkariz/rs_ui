import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/module/input_data/input_data_repository.dart';
import 'package:rs_ui/module/prediksi/prediksi_repository.dart';
import 'package:rs_ui/widget/custom_text.dart';
import 'package:rs_ui/widget/loading/loading_controller.dart';
import 'package:rs_ui/widget/snackbar_util.dart';

class InputDataController extends GetxController {
  final ktpController = TextEditingController();
  final kelasRawatController = TextEditingController();
  final kelaminController = TextEditingController();
  final lamaDirawatController = TextEditingController();
  final umurController = TextEditingController();
  final codeInacbgController = TextEditingController();
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
  final tarifInacbgController = TextEditingController();
  final tarifRsController = TextEditingController();
  final tarifNonbedahController = TextEditingController();
  final tarifBedahController = TextEditingController();
  final tarifKonsultasiController = TextEditingController();
  final tarifTenagaAhliController = TextEditingController();
  final tarifKeperawatanController = TextEditingController();
  final tarifPenunjangController = TextEditingController();
  final tarifRadiologiController = TextEditingController();
  final tarifLabController = TextEditingController();
  final tarifDarahController = TextEditingController();
  final tarifRehabController = TextEditingController();
  final tarifKamarAkomodasiController = TextEditingController();
  final tarifRawatIntensifController = TextEditingController();
  final tarifObatController = TextEditingController();
  final tarifAlkesController = TextEditingController();
  final tarifBMHPController = TextEditingController();
  final tarifSewaAlatController = TextEditingController();
  final tarifObatKronisController = TextEditingController();
  final tarifObatKemoController = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  final repo = InputDataRepository();
  final loading = Get.find<LoadingController>();

  final genderList = ["Laki-laki", "Perempuan"];

  prediksi() async {
    if (keyForm.currentState!.validate()) {
      loading.isLoading = true;
      final body = createRequestBody();
      final result = await repo.inputData(body).catchError((onError) {
        loading.isLoading = false;
        SnackBarUtil.showFlushBarError(
            Get.context!, "Terjadi kesalahan pada sistem");
      });
      if (result != null) {
        showDialog(result);
      }
      loading.isLoading = false;
    }
  }

  createModel() async {
    loading.isLoading = true;
    final result = await repo.createModel();
    if (result != null){
      showDialogCreateModel(result[0], result[1]);
    }
    loading.isLoading = false;
  }

  onSelectedGender(String gender) {
    if (gender == "Laki-kai") {
      kelaminController.text = "1";
    } else {
      kelaminController.text = "2";
    }
  }

  String createDiagnosisCode() {
    final inputDiagnosisList = [
      diagnosisPrimerController.text,
      diagnosisSekunder1Controller.text,
      diagnosisSekunder2Controller.text,
      diagnosisSekunder3Controller.text,
    ];

    final diagnosisList = [];
    for (var element in inputDiagnosisList) {
      if (element != "") {
        diagnosisList.add(element);
      }
    }
    var diagnosisCode = diagnosisList.join(";");
    if (diagnosisCode == "") {
      diagnosisCode = "-";
    }

    return diagnosisCode;
  }

  String createTindakanCode() {
    final inputTindakanList = [
      tindakanPrimerController.text,
      tindakanSekunder1Controller.text,
      tindakanSekunder2Controller.text,
      tindakanSekunder3Controller.text,
    ];

    final tindakanList = [];
    for (var element in inputTindakanList) {
      if (element != "") {
        tindakanList.add(element);
      }
    }
    var tindakanCode = tindakanList.join(";");
    if (tindakanCode == "") {
      tindakanCode = "-";
    }

    return tindakanCode;
  }

  createRequestBody() {
    final request = {
      "NOKARTU": ktpController.text,
      "KELAS_RAWAT": int.parse(kelasRawatController.text),
      "SEX": int.parse(kelaminController.text),
      "lamadirawat": int.parse(lamaDirawatController.text),
      "UMUR_TAHUN": int.parse(umurController.text),
      "diagnosis": createDiagnosisCode(),
      "tindakan": createTindakanCode(),
      "INACBG": codeInacbgController.text,
      "subacute":
          subacuteController.text.isEmpty ? "-" : subacuteController.text,
      "chronic": chronicController.text.isEmpty ? "-" : chronicController.text,
      "sp": spController.text.isEmpty ? "-" : spController.text,
      "sr": srController.text.isEmpty ? "-" : srController.text,
      "si": siController.text.isEmpty ? "-" : siController.text,
      "sd": sdController.text.isEmpty ? "-" : sdController.text,
      "TARIF_INACBG": int.parse(tarifInacbgController.text),
      "TARIF_RS": int.parse(tarifRsController.text),
      "PROSEDUR_NON_BEDAH": int.parse(tarifNonbedahController.text),
      "PROSEDUR_BEDAH": int.parse(tarifBedahController.text),
      "KONSULTASI": int.parse(tarifKonsultasiController.text),
      "TENAGA_AHLI": int.parse(tarifTenagaAhliController.text),
      "KEPERAWATAN": int.parse(tarifKeperawatanController.text),
      "PENUNJANG": int.parse(tarifPenunjangController.text),
      "RADIOLOGI": int.parse(tarifRadiologiController.text),
      "LABORATORIUM": int.parse(tarifLabController.text),
      "PELAYANAN_DARAH": int.parse(tarifDarahController.text),
      "REHABILITASI": int.parse(tarifRehabController.text),
      "KAMAR_AKOMODASI": int.parse(tarifKamarAkomodasiController.text),
      "RAWAT_INTENSIF": int.parse(tarifRawatIntensifController.text),
      "OBAT": int.parse(tarifObatController.text),
      "ALKES": int.parse(tarifAlkesController.text),
      "BMHP": int.parse(tarifBMHPController.text),
      "SEWA_ALAT": int.parse(tarifSewaAlatController.text),
      "OBAT_KRONIS": int.parse(tarifObatKronisController.text),
      "OBAT_KEMO": int.parse(tarifObatKemoController.text)
    };

    return request;
  }

  showDialog(String message) {
    Get.defaultDialog(
      title: message,
      titlePadding: const EdgeInsets.only(top: 24),
      contentPadding: const EdgeInsets.all(24),
      content: const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 70,
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

  showDialogCreateModel(String akurasi, String mse) {
    Get.defaultDialog(
      title: "Hasil",
      contentPadding: const EdgeInsets.all(24),
      content: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h4(text: "Akurasi"),
              h4(text: "Mean Squared Error "),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h4(text: ": $akurasi %"),
              h4(text: ": $mse"),
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
