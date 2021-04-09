import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {

  final bool showOnlyFavorites;

  ProductsGrid(this.showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
     //List<Product> products = Provider.of<Products>(context).items;

    final productsData = Provider.of<Products>(context);
    final products = showOnlyFavorites ? productsData.favoriteItems: productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        // ChangeNotifierProvider.value avec value: products[index] au lieu
        // ChangeNotifierProvider avec create: (BuildContext context) => products[index]
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: products[index],
              //create: (BuildContext context) => products[index],
              child: ProductItem(
                  /*products[index].id, products[index].title,
                  products[index].imageUrl*/
              ),
            ));
  }
}
