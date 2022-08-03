import 'package:efotballactseller_app/views/screens/bottom_navbar.dart';
import 'package:efotballactseller_app/views/screens/feeds_category.dart';
import 'package:efotballactseller_app/views/screens/feeds_screens.dart';
import 'package:efotballactseller_app/views/screens/home_screens.dart';
import 'package:efotballactseller_app/views/screens/search_screen.dart';
import 'package:efotballactseller_app/views/screens/widget/feeds_product.dart';

import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/emptycart.png',
                ),
              ),
            ),
          ),
          Text(
            'You have no favourites',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 90,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return  BottomNavBar();
                }));
              },
              child: Center(
                child: Text(
                  'Search Your Favour Now',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// Navigator.pushNamed(context, DetailPage.id, arguments: productId);
// Navigator.of(context).pushNamed(DetailPage.id, arguments: Products.id);