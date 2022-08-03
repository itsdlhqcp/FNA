import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:efotballactseller_app/views/screens/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //     final _productsProvider = Provider.of<Products>(context);
    // _productsProvider.fetchProducts();
    final productsProvider = Provider.of<Products>(context);
    List<Product> productList = productsProvider.products;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 228, 228, 228),
        title: Text(
          'Feeds Products',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 200 / 218,
        children: List.generate(
          productList.length,
          (index) => ChangeNotifierProvider.value(
            value: productList[index],
            child: FeedsProduct(),
          ),
        ),
      ),
    );
  }
}
