import 'package:flutter/material.dart';
import 'package:flutter_learning/database_1.dart';
import 'package:flutter_learning/details_page.dart';
import 'package:flutter_learning/grid_1.dart';
import 'package:flutter_learning/list_1.dart';

import 'models/cateory_model.dart';

class SubCategoryModel {
  final String name;
  final int subItemId;

  SubCategoryModel({
    required this.name,
    required this.subItemId,
  });
}

class SubCategories extends StatelessWidget {
  final CategoryModel category;
  final int  id;

   SubCategories({
     required this.category,
     required this.id,
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sub Categories"),
      ),
      body: ListView.builder(
        itemCount: category.subitem.length,
        itemBuilder: (BuildContext context, int index) {
          final subcategory = SubCategoryModel(
            name: category.subitem[index]['name'] ?? '', subItemId: category.subitem[index]['subItemId'] ?? 0,
          );
          return Card(
            child: ListTile(
              leading:Text(subcategory.subItemId.toString()) ,
              title: Text(subcategory.name),
              onTap: () {
                if(id==1&&subcategory.subItemId==1) {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListOne(),
                  ),
                );
                }
               else if(id==2&&subcategory.subItemId==1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GridOne(),
                    ),
                  );
                }
               else if(id==3&&subcategory.subItemId==1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DatabaseOne(),
                    ),
                  );
                }
                //
              },
              // You can customize ListTile onTap to perform actions.
            ),
          );
        },
      ),
    );
  }
}
