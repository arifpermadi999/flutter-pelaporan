import 'package:e_commerce/model/pelaporan.dart';
import 'package:flutter/material.dart';

class PelaporanItemCard extends StatelessWidget {
  final Pelaporan data;

  const PelaporanItemCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
            title: Text("Nama Pelapor : " + data.name.toString()),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tgl Lapor : " + data.createdAt.toString()),
                Text("Jenis Pengamatan : " + data.jenisPengamatan.toString()),
                Text("Lokasi Diminati : " + data.lokasiDiminati.toString()),
              ],
            ))
      ],
    ));
  }
}
