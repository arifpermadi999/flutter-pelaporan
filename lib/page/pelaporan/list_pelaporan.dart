import 'package:e_commerce/list_item/item_pelaporan.dart';
import 'package:e_commerce/model/pelaporan.dart';
import 'package:e_commerce/page/pelaporan/form_pelaporan.dart';
import 'package:e_commerce/utility/api_service.dart';
import 'package:flutter/material.dart';

class ListPelaporan extends StatefulWidget {
  const ListPelaporan({Key? key}) : super(key: key);

  @override
  _ListPelaporanState createState() => _ListPelaporanState();
}

class _ListPelaporanState extends State<ListPelaporan> {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = new ApiService();
    return Scaffold(
        appBar: new AppBar(
          title: Text("Pelaporan"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Pelaporan pelaporan = new Pelaporan();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FormPelaporan(
                        pelaporan: pelaporan,
                      )));
            }),
        body: Container(
          child: FutureBuilder(
            future: apiService.getListPelaporan(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("data error"));
              } else if (snapshot.hasData) {
                List<Pelaporan> data = snapshot.data;
                return data.length > 0
                    ? ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Wrap(
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.edit),
                                          title: Text('Edit'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.of(context)
                                                .push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormPelaporan(
                                                        pelaporan: data[index],
                                                        isFromEdit: true,
                                                      )),
                                            )
                                                .then((val) {
                                              setState(() {});
                                            });
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.delete),
                                          title: Text('Delete'),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            ApiService apiService =
                                                new ApiService();
                                            int statusCode = await apiService
                                                .deleteData(data[index].id);
                                            if (statusCode == 200) {
                                              setState(() {
                                                data.removeAt(index);
                                              });
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: PelaporanItemCard(
                                  data: data[index]) //your content here
                              );
                        },
                      )
                    : Center(child: Text('No Items'));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
