import 'package:efotballactseller_app/models/products.dart';
import 'package:efotballactseller_app/views/screens/widget/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/others.dart';
import '../provider/products.dart';

class ALLProducts extends StatelessWidget {
  final othersList = Others.generatesOthers();

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<Products>(context);
    _productsProvider.fetchProducts();
    List<Product> _productList = _productsProvider.products;
    return Container(
      child: Column(
        children: [
          Container(
            height: 250,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                      value: _productList[index],
                      child: ProductItem(
                        index: index,
                      ),
                    ),
                separatorBuilder: (_, index) => SizedBox(),
                itemCount: _productList.length),
          )
        ],
      ),
    );
  }
}
