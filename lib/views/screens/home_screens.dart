
import 'package:efotballactseller_app/models/products.dart';
import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:efotballactseller_app/views/screens/widget/all_products.dart';
import 'package:efotballactseller_app/views/screens/widget/category.dart';
import 'package:efotballactseller_app/views/screens/widget/category_list.dart';
import 'package:efotballactseller_app/views/screens/widget/custom_navbar.dart';

import 'package:efotballactseller_app/views/screens/widget/search_input.dart';
import 'package:efotballactseller_app/views/screens/widget/tagList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
   
    return Scaffold(
       
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SearchInput(),
          TagList(),
          Category(),
          CategoryList(),
          ALLProducts(),
        ],
      ),
    ));
  }
}
