import 'package:badges/badges.dart';
import 'package:efotballactseller_app/models/products.dart';
import 'package:efotballactseller_app/views/screens/detail/detail_page.dart';

import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _productsProvider = Provider.of<Products>(context);
    final products = Provider.of<Product>(context);
     final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
    // List<Product> _productList = _productsProvider.products;
    return Container(
      margin: EdgeInsets.all(
        15,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailPage.id, arguments: products.id);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(products.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 15,
                    child: Badge(
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Color.fromARGB(255, 183, 58, 58),
                      borderRadius: BorderRadius.circular(8),
                      badgeContent:
                          Text('NEW', style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
              Text(
                products.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              Text(
                '\$${products.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
