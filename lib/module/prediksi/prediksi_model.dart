import 'dart:convert';

Prediksi prediksiFromJson(String str) => Prediksi.fromJson(json.decode(str));

String prediksiToJson(Prediksi data) => json.encode(data.toJson());

class Prediksi {
  Prediksi({
    required this.code,
    required this.data,
  });

  int code;
  Data data;

  factory Prediksi.fromJson(Map<String, dynamic> json) => Prediksi(
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.prediksi,
    required this.jumlah,
    required this.tarifRs,
    required this.tarifInacbg,
  });

  String prediksi;
  double jumlah;
  double tarifRs;
  double tarifInacbg;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        prediksi: json["prediksi"],
        jumlah: double.parse(json["jumlah"]),
        tarifRs: double.parse(json["tarif_rs"]),
        tarifInacbg: double.parse(json["tarif_inacbg"]),
      );

  Map<String, dynamic> toJson() => {
        "prediksi": prediksi,
        "jumlah": jumlah,
        "tarif_rs": tarifRs,
        "tarif_inacbg": tarifInacbg
      };
}
