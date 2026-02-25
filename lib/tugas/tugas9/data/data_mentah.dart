// To parse this JSON data, do
//
//     final dataMentah = dataMentahFromJson(jsonString);

import 'dart:convert';

List<DataMentah> dataMentahFromJson(String str) => List<DataMentah>.from(json.decode(str).map((x) => DataMentah.fromJson(x)));

String dataMentahToJson(List<DataMentah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataMentah {
    String? kategori;
    String? subKategori;
    String? gambar;

    DataMentah({
        this.kategori,
        this.subKategori,
        this.gambar,
    });

    factory DataMentah.fromJson(Map<String, dynamic> json) => DataMentah(
        kategori: json["kategori"],
        subKategori: json["SubKategori"],
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
        "kategori": kategori,
        "SubKategori": subKategori,
        "gambar": gambar,
    };
}
