import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/ItemModel.dart';

class ItemProvider extends ChangeNotifier {
  List<ItemModel> list = [];
  void getList() async {
    String url = "https://fakestoreapi.com/products";
    var rs = await http.Client().get(Uri.parse(url));
    var jsonOject = jsonDecode(rs.body) as List;
    list = jsonOject.map((e) {
      return ItemModel.fromjson(e);
    }).toList();
    notifyListeners();
  }
}