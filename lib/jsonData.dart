// ignore_for_file: file_names

import 'dart:convert';

class Product {
  int id;
  String name;

  Product(this.id, this.name);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json["id"] as int, json["name"] as String);
  }
}

String singleProductDb = '{ "products" : { "id" : 1,"name" : "pencil" } }';
String multiProductDb =
    '{ "products" :[ { "id" : 1,"name" : "pencil" },{ "id" : 2,"name" : "book" },{ "id" : 3,"name" : "eraser" }] }';

var singleProductJson = json.decode(singleProductDb);
var multiProductJson = json.decode(multiProductDb);
