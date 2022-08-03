import 'package:efotballactseller_app/models/products.dart';
import 'package:efotballactseller_app/views/screens/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsProduct extends StatefulWidget {
  @override
  State<FeedsProduct> createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  List<Product> _products = [
    Product(
      id: 'pubg',
      title: 'pubg',
      description: 'beast account',
      price: 99.9,
      imageUrl: 'assets/images/super.jpeg',
      category: 'pes',
    ),
    Product(
      id: 'gucci',
      title: 'gucci',
      description: 'beast account',
      price: 99.9,
      imageUrl: 'assets/images/super.jpeg',
      category: 'pes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Products = Provider.of<Product>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailPage.id, arguments: Products.id);
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
                    height: size.height / 5.45,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(Products.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  /////////222222222222222222222222222222
                  Positioned(
                    right: 20,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
              //////////22222222222222222222222222222222222222222222222222222222
              Text(
                Products.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              //////22222222222222222222222222222222222222222222222222222
              Text(
                '\$${Products.price}',
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
