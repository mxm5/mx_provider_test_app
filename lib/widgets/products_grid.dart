import 'package:flutter/material.dart';
import 'package:mx_b/providers/product.dart';
import 'package:mx_b/providers/products.dart';
import 'package:mx_b/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product> loadedProducts = Provider.of<Products>(context).items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return GridTile(
            child: ChangeNotifierProvider.value(
          value: loadedProducts[i],
          //? this way is better when we are reusing widgets not recreating them
          // create: (c) => loadedProducts[i],//! old way
          //* we give this here because they are instantiated models that had
          //* started we just injected them their own notifiers so now they can be provided here and
          //* we dont need to start objects here
          //* so now we dont need to pass the products any more via constructors
          child: ProductItem(),
        ));
      },
      itemCount: loadedProducts.length,
    );
  }
}
