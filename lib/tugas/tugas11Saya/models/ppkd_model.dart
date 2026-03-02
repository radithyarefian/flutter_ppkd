import 'dart:convert';

class PpkdModel {
  final int? id;
  final String nama;
  final String jurusan;
  PpkdModel({
    this.id,
    required this.nama,
    required this.jurusan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'jurusan': jurusan,
    };
  }

  factory PpkdModel.fromMap(Map<String, dynamic> map) {
    return PpkdModel(
      id: map['id']?.toInt(),
      nama: map['nama'] ?? '',
      jurusan: map['jurusan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PpkdModel.fromJson(String source) =>
      PpkdModel.fromMap(json.decode(source));
}
