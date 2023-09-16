import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_learning/sub_categories.dart';

import 'models/cateory_model.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<CategoryModel> data = [];

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    // Load JSON data from your asset
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/category_with_subcategory.json');

    print("json>>>>>>>>>>>>>>>>>>>>>>$jsonString");

    // Parse JSON data into Dart objects
    final jsonData = json.decode(jsonString);

    final List<CategoryModel> dataList = (jsonData['data'] as List)
        .map((item) => CategoryModel.fromJson(item))
        .toList();

    setState(() {
      data = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    const textSize = 16.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final category = data[index];
          return Card(
            child: ListTile(
              leading: Text(
                "${category.id}.",
                style: const TextStyle(fontSize: textSize),
              ),
              title: Text(category.name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SubCategories(
                      category: category,
                      id: category.id,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
