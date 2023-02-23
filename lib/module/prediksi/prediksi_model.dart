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
    });

    String prediksi;
    String jumlah;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        prediksi: json["prediksi"],
        jumlah: json["jumlah"],
    );

    Map<String, dynamic> toJson() => {
        "prediksi": prediksi,
        "jumlah": jumlah,
    };
}
