import 'dart:convert';

import 'package:eclarios/models/segments_api_model.dart';

import '../models/home_medicine_model.dart';
import 'package:http/http.dart' as http;

import '../models/mylist_api_model.dart';
import '../models/search_api_model.dart';

class StatesServices {
  Future<HomeMedicineModel> getMedicine() async {
    final responce = await http
        .get(Uri.parse("https://myeclapi.000webhostapp.com/products/read.php"
            //"http://10.0.2.2/add_product_api_practice/products/read.php"
            ));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      return HomeMedicineModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<SegmentsApiModel> getSegment() async {
    final responce = await http.get(Uri.parse(
        "https://myeclapi.000webhostapp.com/products/readsegment.php"
        //"http://10.0.2.2/add_product_api_practice/products/readsegment.php"
        ));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      return SegmentsApiModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<SearchApiModel> getSearch() async {
    final responce = await http.get(
        Uri.parse("https://myeclapi.000webhostapp.com/products/readsearch.php"
            //"http://10.0.2.2/add_product_api_practice/products/readsearch.php"
            ));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      return SearchApiModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<MyListApiModel> getList() async {
    final responce = await http.get(
        Uri.parse("https://myeclapi.000webhostapp.com/products/readlist.php"
            //"http://10.0.2.2/add_product_api_practice/products/readlist.php"
            ));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      return MyListApiModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}
