import 'package:efotballactseller_app/models/cart_attr.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItem {
    return {..._cartItems};
  }

  // double get totalAmount {
  //   var total = 0.0;

  //   _cartItems.forEach((key, value) {
  //     total +=  value.price * value.quantity;
  //   });
  //   return total;
  // }
  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (extingCartItem) => CartAttr(
                id: extingCartItem.id,
                title: extingCartItem.title,
                price: extingCartItem.price,
                quantity: extingCartItem.quantity + 1,
                imageUrl: extingCartItem.imageUrl,
              ));
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeCartItem(productId) {
    _cartItems.remove(productId);

    notifyListeners();
  }

  void clearCartData() {
    _cartItems.clear();

    notifyListeners();
  }
}
