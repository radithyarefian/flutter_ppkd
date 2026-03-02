import 'dart:convert';

class SiswaModel {
  final int? id;
  final String nama;
  final String kelas;
  SiswaModel({
    this.id,
    required this.nama,
    required this.kelas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'kelas': kelas,
    };
  }

  factory SiswaModel.fromMap(Map<String, dynamic> map) {
    return SiswaModel(
      id: map['id']?.toInt(),
      nama: map['nama'] ?? '',
      kelas: map['kelas'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SiswaModel.fromJson(String source) => SiswaModel.fromMap(json.decode(source));
}
