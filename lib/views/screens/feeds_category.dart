import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:efotballactseller_app/views/screens/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsCategoryScreen extends StatelessWidget {
  static const String id = 'feedsCategoryScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    final categoryName = ModalRoute.of(context)!.settings.arguments as String;

    final productList = productsProvider.findByCategory(categoryName);
    return Scaffold(
      appBar: AppBar(
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
