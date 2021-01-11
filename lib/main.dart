import 'package:flutter/material.dart';
import 'package:mx_b/providers/products.dart';
import 'package:mx_b/screens/product_detail.dart';
import 'package:mx_b/screens/products_overview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: ProductsView.routeName,
        routes: {
          ProductsView.routeName: (ctx) => ProductsView(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
        },
      ),
    );
  }
}
