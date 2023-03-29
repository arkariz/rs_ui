import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rs_ui/widget/snackbar_util.dart';

class InputDataRepository {
  final _connect = GetConnect();

  Future<String?> inputData(Map<String, dynamic> body) async {
    final response = await _connect.post(
      "http://localhost:8080/input-data", //https://rs_api-1-t4657994.deta.app/input-data",
      body,
      //headers: {"X-Space-App-Key": "U2WB4N67kkUGP3bnLvxYze9zbeDGGbNv"},
    );
    if (response.isOk) {
      return "Input data berhasil";
    } else {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        SnackBarUtil.showFlushBarError(
            Get.context!, "Terjadi kesalahan pada sistem");
        return null;
      } else {
        SnackBarUtil.showFlushBarError(
            Get.context!, "Tidak ada koneksi internet");
        return null;
      }
    }
  }
}
