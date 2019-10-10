import 'package:flutter/material.dart';
import 'package:flutter_course/providers/products_provider.dart';
import 'package:flutter_course/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.showOnlyFavorites);

  final bool showOnlyFavorites;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showOnlyFavorites ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          final product = products[i];
          // We need to use value provider to prevent list recreation issues
          return ChangeNotifierProvider.value(
              value: product, child: ProductItem());
        });
  }
}
