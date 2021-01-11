import 'package:flutter/material.dart';
import 'package:mx_b/providers/product.dart';
import 'package:mx_b/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final p =
        Provider.of<Products>(context, listen: false).findById(id) as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
    );
  }
}
