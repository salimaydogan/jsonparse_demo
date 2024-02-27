// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:json_demo/Jsondata.dart';

class JsonParse extends StatefulWidget {
  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  Product newProduct = Product(0, "");
  List<Product> productsList = [];

  void singleParse() {
    newProduct = Product.fromJson(singleProductJson["products"]);

    //  print("ID: ${newProduct.id}\nName: ${newProduct.name}");
  }

  void multiParse() {
    List jsonList = multiProductJson["products"];
    productsList.clear();
    for (var p in jsonList) {
      productsList.add(Product.fromJson(p));
    }

    print(productsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Json Parse Demo",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                      child: const Text("Single Product"),
                      onPressed: () {
                        singleParse();
                        setState(() {});
                      }),
                  Text("ID: ${newProduct.id.toString()}"),
                  Text("Name: ${newProduct.name}"),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      child: const Text("Multi Products"),
                      onPressed: () {
                        multiParse();
                        setState(() {});
                      }),
                ],
              ),
              productsList.isNotEmpty
                  ? listViewWidget(productsList: productsList)
                  : const Text("List count 0")
            ],
          ),
        ),
      ),
    );
  }
}

class listViewWidget extends StatelessWidget {
  const listViewWidget({
    super.key,
    required this.productsList,
  });

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: 15,
        child: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("ID: ${productsList[index].id} "),
              subtitle: Text("Name: ${productsList[index].name}"),
            );
          },
        ),
      ),
    );
  }
}
