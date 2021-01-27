import 'package:flutter/material.dart';
import 'package:mx_b/providers/product.dart';
import 'package:mx_b/screens/product_detail.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Product>(context, listen: false);
    //! this does not rebuild just reads once
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetail.routeName, arguments: p.id);
        },
        child: GridTile(
          footer: GridTileBar(
            title: Text(p.title),
            backgroundColor: Colors.black38,
            leading: Consumer<Product>(
              //? this only listens to what is provided toper and always rebuild
              builder: (ctx, product, _) => IconButton(
                onPressed: () {
                  product.toggleFavorite();
                },
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          child: Image.network(
            p.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
