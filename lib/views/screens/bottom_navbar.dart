import 'package:efotballactseller_app/const.dart';
import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
  
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
     final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          activeColor: Colors.white,
          inactiveColor: Colors.blueGrey,
          backgroundColor: backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.rss_feed,
                  size: 30,
                ),
                label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 27,
                ),
                label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload,
                  size: 30,
                ),
                label: 'upload'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'person')
          ]),
      body: pages[pageIndex],
    );
  }
}
