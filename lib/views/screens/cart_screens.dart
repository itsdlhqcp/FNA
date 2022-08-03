import 'package:efotballactseller_app/views/screens/provider/cart_provider.dart';
import 'package:efotballactseller_app/views/screens/widget/cart_empty.dart';
import 'package:efotballactseller_app/views/screens/widget/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    return  _cartProvider.getCartItem.isNotEmpty? Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 228, 228, 228),
        title: Text(
          'My ${_cartProvider.getCartItem.length} Favourites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _cartProvider.clearCartData();
            },
            icon: Icon(
              CupertinoIcons.trash,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _cartProvider.getCartItem.length,
          itemBuilder: (BuildContext context, int index) {
            return ChangeNotifierProvider.value(
              value: _cartProvider.getCartItem.values.toList()[index],
              child: CartItem(
                productId: _cartProvider.getCartItem.keys.toList()[index],
                // id: _cartProvider.getCartItem.values.toList()[index].id,
                // productId: _cartProvider.getCartItem.keys.toList()[index],
                // price: _cartProvider.getCartItem.values.toList()[index].price,
                // imageUrl: _cartProvider.getCartItem.values.toList()[index].imageUrl,
                // title: _cartProvider.getCartItem.values.toList()[index].title,
              ),
            );
          }),
    ):Scaffold(
      body: CartEmpty(),
    );
  }
}
