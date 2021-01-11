import 'package:flutter/material.dart';
import 'package:mx_b/widgets/products_grid.dart';

class ProductsView extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my shop'),
      ),
      //* we dont provide anything here to not rerender the app bar
      body: ProductsGrid(),
    );
  }
}
