import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products(this.products);

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return _buildProductsList();
  }

  Widget _buildProductsList() {
    Widget productCards;
    if (products.isNotEmpty) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Center(
        child: const Text('No products found, please add some'),
      );
    }
    return productCards;
  }

  Card _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    products[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$' + products[index]['price'].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                child: Text("Santa Bárbara, Toledo"),
              )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, "/product/" + index.toString()),
              )
            ],
          )
        ],
      ),
    );
  }
}
