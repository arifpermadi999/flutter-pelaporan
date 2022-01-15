import 'package:e_commerce/model/pelaporan.dart';
import 'package:e_commerce/utility/api_service.dart';
import 'package:flutter/material.dart';

class FormPelaporan extends StatefulWidget {
  final Pelaporan pelaporan;
  final isFromEdit;
  const FormPelaporan({required this.pelaporan, this.isFromEdit = false});

  @override
  FormPelaporanState createState() => FormPelaporanState();
}

class FormPelaporanState extends State<FormPelaporan> {
  final nameController = TextEditingController();
  final detailLokasiController = TextEditingController();
  final deskripsiPengamatanController = TextEditingController();
  final intervensiDilakukanController = TextEditingController();

  String lokasiDiminati = "";
  String keamananValue = "";
  String jenisPengamatanValue = "";
  String kategoriValue = "";
  String tindakLanjutValue = "";
  String kegentinganValue = "";

  @override
  Widget build(BuildContext context) {
    if (widget.isFromEdit) {
      getEditData();
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text("Form Pelaporan"),
        actions: [
          IconButton(
              onPressed: () {
                print("testing");
                saveData();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============= card 1
              Card(
                child: Column(children: [
                  TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        hintText: "Nama Pelapor",
                      )),
                  DropdownButtonFormField(
                    value: jenisPengamatanValue.isNotEmpty
                        ? jenisPengamatanValue
                        : null,
                    onChanged: (value) {
                      setState(() {
                        jenisPengamatanValue = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                    hint: Text('-- Jenis Pengamatan --'),
                    items: jenisPengamatanData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField(
                    value: keamananValue.isNotEmpty ? keamananValue : null,
                    onChanged: (value) {
                      setState(() {
                        keamananValue = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                    hint: Text('-- Aman / Tidak Aman --'),
                    items: keamananData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  )
                ]),
              ),
              //======= card 2
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Detail Lokasi",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Card(
                child: Column(children: [
                  TextFormField(
                      controller: detailLokasiController,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration()),
                  DropdownButtonFormField(
                    value: kategoriValue.isNotEmpty ? kategoriValue : null,
                    onChanged: (value) {
                      setState(() {
                        kategoriValue = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                    hint: Text('-- Kategori --'),
                    items: kategoriData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ]),
              ),
              // ============= card 3
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Deskripsi Pengamatan",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Card(
                child: TextFormField(
                    controller: deskripsiPengamatanController,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration()),
              ),
              //  ============== card 4
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Interverensi yang dilakukan",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Card(
                child: TextFormField(
                    controller: intervensiDilakukanController,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration()),
              ),
              //============= card 5
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Potensi Cedera",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Card(
                child: Column(children: [
                  DropdownButtonFormField(
                    value:
                        tindakLanjutValue.isNotEmpty ? tindakLanjutValue : null,
                    onChanged: (value) {
                      setState(() {
                        tindakLanjutValue = value.toString();
                      });
                    },
                    isExpanded: true,
                    isDense: false,
                    itemHeight: 60, //what you need for height
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                    hint: Text('-- Perlu Tindak Lanjut --'),
                    items: tindakLanjutData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField(
                    value:
                        kegentinganValue.isNotEmpty ? kegentinganValue : null,
                    onChanged: (value) {
                      setState(() {
                        kegentinganValue = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                    hint: Text('-- Apakah Genting --'),
                    items: apakahGentingData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveData() async {
    Pelaporan pelaporan = new Pelaporan();

    pelaporan.name = nameController.text;
    pelaporan.jenisPengamatan = jenisPengamatanValue;
    pelaporan.lokasiKeamanan = keamananValue;
    pelaporan.lokasiDiminati = lokasiDiminati;
    pelaporan.detailLokasi = detailLokasiController.text;
    pelaporan.kategori = kategoriValue;
    pelaporan.deskripsiPengamatan = deskripsiPengamatanController.text;
    pelaporan.intervensiDilakukan = intervensiDilakukanController.text;
    pelaporan.tindakLanjutPotensiCedera = tindakLanjutValue;
    pelaporan.kegentinganPotensiCedera = kegentinganValue;
    ApiService apiService = new ApiService();
    if (widget.pelaporan.id != null) {
      pelaporan.id = widget.pelaporan.id;
      int statuscode = await apiService.updateData(pelaporan.toJson());
      if (statuscode == 200) {
        Navigator.pop(context, true);
      }
    } else {
      int statuscode = await apiService.saveData(pelaporan.toJson());
      if (statuscode == 200) {
        Navigator.pop(context, true);
      }
    }
  }

  void getEditData() {
    if (widget.pelaporan.name!.isNotEmpty) {
      setState(() {
        nameController.text = widget.pelaporan.name!;
        jenisPengamatanValue = widget.pelaporan.jenisPengamatan!;
        keamananValue = widget.pelaporan.lokasiKeamanan!;
        lokasiDiminati = widget.pelaporan.lokasiDiminati!;
        detailLokasiController.text = widget.pelaporan.detailLokasi!;
        kategoriValue = widget.pelaporan.kategori!;
        deskripsiPengamatanController.text =
            widget.pelaporan.deskripsiPengamatan!;
        intervensiDilakukanController.text =
            widget.pelaporan.intervensiDilakukan!;
        tindakLanjutValue = widget.pelaporan.tindakLanjutPotensiCedera!;
        kegentinganValue = widget.pelaporan.kegentinganPotensiCedera!;
      });
    }
  }
}
