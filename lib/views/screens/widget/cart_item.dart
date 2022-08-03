import 'package:efotballactseller_app/models/cart_attr.dart';
import 'package:efotballactseller_app/views/screens/detail/detail_page.dart';
import 'package:efotballactseller_app/views/screens/provider/cart_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;

  const CartItem({Key? key, required this.productId}) : super(key: key);
  // final String id;
  // final String productId;
  // final String title;
  // final double price;
  // // final String quantity;
  // final String imageUrl;

  // const CartItem(
  //     {Key? key,
  //     required this.id,
  //     required this.productId,
  //     required this.title,
  //     required this.price,
  //     // required this.quantity,
  //     required this.imageUrl})
  //     : super(
  //         key: key,
  //       );
  @override
  Widget build(BuildContext context) {
    final _cartAttr = Provider.of<CartAttr>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.id, arguments: productId);
      },
      child: Container(
        margin: EdgeInsets.all(4.5),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Color.fromARGB(255, 214, 214, 214),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      '${_cartAttr.imageUrl}',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_cartAttr.title}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _cartProvider.removeCartItem(productId);
                          },
                          icon: Icon(CupertinoIcons.delete_left),
                          color: Color.fromARGB(255, 193, 73, 64),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${_cartAttr.price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '6030\$',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.pink,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
