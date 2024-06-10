import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_with_api/repository/api/model/apimodelclass.dart';

class HomePageController with ChangeNotifier {
  List<Apiarticles>? apiarticles = [];
  bool isloding = false;

  static List detailkey = [];
  // static List details = [];

  var mybox = Hive.box("products");

  void addData({
    required String title,
    required String img,
    required String price,
  }) {
    mybox.add(
      {
        "title": title,
        "img": img,
        "price": price,
      },
    );
    notifyListeners();
  }

  void delete(int index) {
    mybox.deleteAt(index);
    detailkey = mybox.keys.toList();
    notifyListeners();
  }

  Future<List<Apiarticles>?> fetchdata() async {
    isloding = true;
    final uri = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decodeddata = jsonDecode(response.body);

      apiarticles =
          decodeddata.map<Apiarticles>((e) => Apiarticles.fromJson(e)).toList();
      isloding = false;
      return apiarticles;
    }
    notifyListeners();
    return null;
  }
}
