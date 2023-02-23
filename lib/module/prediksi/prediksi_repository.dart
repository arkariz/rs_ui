import 'package:get/get.dart';
import 'package:rs_ui/module/prediksi/prediksi_model.dart';

class PrediksiRepository {
  final _connect = GetConnect();

  Future<Prediksi> getPrediksi(Map<String, dynamic> body) async {
    print(body);
    final response = await _connect.post(
      "https://rs_api-1-t4657994.deta.app/prediksi",
      body,
      headers: {
        "Cookie":
            "deta_auth_token=eyJraWQiOiJzTjVnTk43cWFGVmpPYVwvc3oyVTJvdnNIMTZyNThQb2RQVFpRZWlBQUhNZz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiI4ZDBiMmY5ZC00ZjFlLTQ1ZjEtYWUzZC01NmY1ZmQ4YTY5NTEiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuZXUtY2VudHJhbC0xLmFtYXpvbmF3cy5jb21cL2V1LWNlbnRyYWwtMV9WYUhoMEVvWDUiLCJjbGllbnRfaWQiOiIzMGpnaTM0MzlsbWRnN3V0dGUyN2dkbDlnYSIsIm9yaWdpbl9qdGkiOiI2ZmI3MGM1Zi0wMzEzLTRjZGMtOTBmNy1lNmM1ODYzOWY4ZDciLCJldmVudF9pZCI6IjA4NjUxMjc1LWFmMWEtNDU3OS04OGU3LTY3YjlkZDZmODFkMiIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2NzcxNDM5ODMsImV4cCI6MTY3NzIzMDM4MywiaWF0IjoxNjc3MTQzOTg0LCJqdGkiOiI0YWVlYTYyMS0wNTVlLTQ4ODMtOGM5Yi1jY2JiMWY1N2U4MjIiLCJ1c2VybmFtZSI6ImZrbXJpc2t5MTEifQ.VTmNZ9ALc9wbl5iPFHtBhyiEV2Jtp_BIauY_saVd5qBS327Ualgms3onbRJjgxzUpLZ47eDmwuJ_KJX5ngk-_BhVMoa0aAEFhFQmy0AGDdIECeCBMIrYyamft1wF8esw1JQIcp_wfVouTURBX8Q_Tw0tnPsElgxquwy8NUInWbMbCa88SZXCEvxPFlh_FJoxWqZTghkr1P6zbaaBFv63H9lESwjDqlZ2suMlPI_N2Mqkcg_rFcDBz1PkU26fsD-6AKt9WhRe8bDNDG9_9o8qV7xMlFleBC0ccc_NBRKRtL4pLtDBBbxFWkFBErMOaetq9Rm8FLY_ZF-ECor1PXx7yQ"
      },
    );
    print(response.statusCode);
    print(response.body);
    return prediksiFromJson(response.body);
  }
}
