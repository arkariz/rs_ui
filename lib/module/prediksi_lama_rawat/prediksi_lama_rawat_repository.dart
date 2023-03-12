import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rs_ui/widget/snackbar_util.dart';

class PrediksiLamaRawatRepository {
  final _connect = GetConnect();

  Future<String?> getPrediksiLamaRawat(Map<String, dynamic> body) async {
    final response = await _connect.post(
      "http://127.0.0.1:8000/prediksi-lama-rawat", //"https://rs_api-1-t4657994.deta.app/prediksi",
      body,
      //headers: {"X-Space-App-Key": "U2WB4N67kkUGP3bnLvxYze9zbeDGGbNv"},
    );
    if (response.isOk) {
      return response.body['data']['prediksi'].toString();
    } else {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        SnackBarUtil.showFlushBarError(Get.context!, response.body['detail']);
        return null;
      } else {
        SnackBarUtil.showFlushBarError(
            Get.context!, "Tidak ada koneksi internet");
        return null;
      }
    }
  }
}
