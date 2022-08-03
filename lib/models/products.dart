
import 'package:flutter/widgets.dart';

class Product with ChangeNotifier {
  final String id;
  // final String userId;
  // final String productid;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Product(
      {required this.id,
      // required this.userId,
      // required this.productid,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
       required this.category,
      });

  findById(String productId) {}
}