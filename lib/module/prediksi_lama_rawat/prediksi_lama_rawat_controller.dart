import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/module/prediksi_lama_rawat/prediksi_lama_rawat_repository.dart';
import 'package:rs_ui/widget/custom_text.dart';
import 'package:rs_ui/widget/loading/loading_controller.dart';
import 'package:rs_ui/widget/snackbar_util.dart';

class PrediksiLamaRawatController extends GetxController {
  final diagnosisPrimerController = TextEditingController();
  final diagnosisSekunder1Controller = TextEditingController();
  final diagnosisSekunder2Controller = TextEditingController();
  final diagnosisSekunder3Controller = TextEditingController();
  final tindakanPrimerController = TextEditingController();
  final tindakanSekunder1Controller = TextEditingController();
  final tindakanSekunder2Controller = TextEditingController();
  final tindakanSekunder3Controller = TextEditingController();
  final kelasRawat = TextEditingController();
  final umur = TextEditingController();
  final kelaminController = TextEditingController();

  final hasilPrediksi = "".obs;
  final jumlah = "".obs;
  final tarifRs = "".obs;
  final tarifInacbg = "".obs;
  final isLoading = false.obs;
  final genderList = ["Laki-laki", "Perempuan"];
  final kelasList = ["1", "2", "3"];

  final keyForm = GlobalKey<FormState>();
  final repo = PrediksiLamaRawatRepository();
  final loading = Get.find<LoadingController>();

  prediksi() async {
    if (keyForm.currentState!.validate()) {
      loading.isLoading = true;
      final body = createRequestBody();
      final result =
          await repo.getPrediksiLamaRawat(body).catchError((onError) {
        loading.isLoading = false;
        SnackBarUtil.showFlushBarError(
            Get.context!, "Terjadi kesalahan pada sistem");
      });

      if (result != null) {
        hasilPrediksi(result);
        loading.isLoading = false;
        showDialog();
      }
      loading.isLoading = false;
    }
  }

  onSelectedKelas(String kelas) {
    kelasRawat.text = kelas;
  }

  onSelectedGender(String gender) {
    if (gender == "Laki-kai") {
      kelaminController.text = "1";
    } else {
      kelaminController.text = "2";
    }
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
      "kelasrawat": int.parse(kelasRawat.text),
      "sex": int.parse(kelaminController.text),
      "umur": int.parse(umur.text),
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
          h4(text: "${hasilPrediksi.value.capitalizeFirst!} Hari"),
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
