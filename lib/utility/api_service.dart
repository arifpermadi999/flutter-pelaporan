import 'dart:convert';

import 'package:e_commerce/model/pelaporan.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl =
      "http://202.157.186.36/flutter-api/public/index.php/api";

  Client client = Client();

  Future<List<Pelaporan>?> getListPelaporan() async {
    final response = await client.get(
      Uri.parse('$baseUrl/pelaporan'),
    );
    if (response.statusCode == 200) {
      return listPelaporanFromJson(response.body);
    }
    return null;
  }

  Future<int> saveData(bodyData) async {
    print(bodyData);
    final response = await client.post(
      Uri.parse('$baseUrl/pelaporan/store'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(bodyData),
    );

    return response.statusCode;
  }

  Future<int> updateData(bodyData) async {
    final response = await client.post(
      Uri.parse('$baseUrl/pelaporan/update'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(bodyData),
    );
    return response.statusCode;
  }

  Future<int> deleteData(id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/pelaporan/delete/$id'),
    );

    return response.statusCode;
  }
}
