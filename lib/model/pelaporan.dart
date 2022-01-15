import 'dart:convert';

class Pelaporan {
  int? id;
  String? name;
  String? jenisPengamatan;
  String? lokasiKeamanan;
  String? lokasiDiminati;
  String? detailLokasi;
  String? kategori;
  String? deskripsiPengamatan;
  String? intervensiDilakukan;
  String? tindakLanjutPotensiCedera;
  String? kegentinganPotensiCedera;
  String? createdAt;
  String? updatedAt;

  Pelaporan(
      {this.id,
      this.name,
      this.jenisPengamatan,
      this.lokasiKeamanan,
      this.lokasiDiminati,
      this.detailLokasi,
      this.kategori,
      this.deskripsiPengamatan,
      this.intervensiDilakukan,
      this.tindakLanjutPotensiCedera,
      this.kegentinganPotensiCedera,
      this.createdAt,
      this.updatedAt});

  Pelaporan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jenisPengamatan = json['jenis_pengamatan'];
    lokasiKeamanan = json['lokasi_keamanan'];
    lokasiDiminati = json['lokasi_diminati'];
    detailLokasi = json['detail_lokasi'];
    kategori = json['kategori'];
    deskripsiPengamatan = json['deskripsi_pengamatan'];
    intervensiDilakukan = json['intervensi_dilakukan'];
    tindakLanjutPotensiCedera = json['tindak_lanjut_potensi_cedera'];
    kegentinganPotensiCedera = json['kegentingan_potensi_cedera'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['jenis_pengamatan'] = this.jenisPengamatan;
    data['lokasi_keamanan'] = this.lokasiKeamanan;
    data['lokasi_diminati'] = this.lokasiDiminati;
    data['detail_lokasi'] = this.detailLokasi;
    data['kategori'] = this.kategori;
    data['deskripsi_pengamatan'] = this.deskripsiPengamatan;
    data['intervensi_dilakukan'] = this.intervensiDilakukan;
    data['tindak_lanjut_potensi_cedera'] = this.tindakLanjutPotensiCedera;
    data['kegentingan_potensi_cedera'] = this.kegentinganPotensiCedera;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  bool checkIfAnyIsNull() {
    return [id].contains(null);
  }
}

List<Pelaporan> listPelaporanFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Pelaporan>.from(data.map((item) => Pelaporan.fromJson(item)));
}

var jenisPengamatanData = [
  "Lingkungan Kerja",
  "Kesehatan Kerja",
  "Keselamatan Kerja"
];
var keamananData = ["Aman", "Tidak Aman"];
var lokasiDiminatiData = [
  "Gedung A",
  "Gedung B",
  "Gedung C",
];
var kategoriData = [
  "Pest Control",
  "Kebersihan Lingkungan & Peralatan",
  "Terjepit",
  "Benda Jatuh",
];
var tindakLanjutData = [
  "Efek kesehatan atau penyakit ringan",
  "Efek sedang yang bersifat tetap",
  "Efek kesehatan berat yang bersifat tetap dan mengancam kehidupan",
  "Terjadinya beberapa ffek kesehatan berat yang bersifat tetap dan mengancam kehidupan",
];
var apakahGentingData = ["Genting", "Tidak Genting"];
