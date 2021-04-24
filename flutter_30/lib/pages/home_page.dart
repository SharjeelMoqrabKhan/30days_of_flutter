import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_30/model/catelog.dart';
import 'package:flutter_30/widgets/ItemWidget.dart';
import 'package:flutter_30/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catelogJson =
        await rootBundle.loadString('assets/files/catelog.json');
    final decodedData = jsonDecode(catelogJson);
    var productData = decodedData["products"];
    Catelog.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Catelog.items != null && Catelog.items.isNotEmpty)
            ? ListView.builder(
                itemCount: Catelog.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: Catelog.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
