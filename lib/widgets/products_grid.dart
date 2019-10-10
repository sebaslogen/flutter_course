import 'package:flutter/material.dart';
import 'package:flutter_course/providers/products_provider.dart';
import 'package:flutter_course/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context).items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) {
          final product = loadedProducts[i];
          return ProductItem(product.id, product.title, product.imageUrl);
        });
  }
}
