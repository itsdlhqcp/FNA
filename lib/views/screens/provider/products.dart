import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efotballactseller_app/const.dart';
import 'package:flutter/cupertino.dart';


import '../../../models/products.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];
  Future<void> fetchProducts() async {
    await firebaseStore
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      productSnapshot.docs.forEach((element) {
        _products.insert(
          0,
          Product(
            id: element.get('id'),
            title: element.get('title'),
            description: element.get('description'),
            
            //  element
            // .get('price'),
            price: double.parse(element.get('price')),
            imageUrl: element.get('imageUrl'),
            category: element.get('category'),
          ),
        );
      });
    });
  }

  Product findById(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }

  List<Product> get products {
    return _products;
  }

  List<Product> findByCategory(String categoryName) {
    List _categoryList = _products
        .where((element) =>
            element.category.toLowerCase().contains(categoryName.toLowerCase()))
        .toList();

    return [..._categoryList];
  }

  List<Product> searchQuery(String searchText) {
    List _searchList = _products
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return [..._searchList];
  }
}
