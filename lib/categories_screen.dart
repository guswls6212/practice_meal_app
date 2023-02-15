import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: [],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        // so for 200 widht, I want to have 300 height
        childAspectRatio: 3 / 2,
        // how much distance is between our columns and rows in that grid
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
