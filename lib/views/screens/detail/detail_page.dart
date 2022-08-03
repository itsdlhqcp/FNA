import 'package:efotballactseller_app/views/screens/provider/cart_provider.dart';
import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const String id = 'detailPage';

  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<Products>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    final ProductId = ModalRoute.of(context)!.settings.arguments as String;
    final ProductAttr = ProductData.findById(ProductId);
    String url;
    String jpg;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 232, 229, 229),
        title: Text(
          'Account Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // MaterialButton(onPressed: () async
              // {String url = '${ProductAttr.imageUrl}';}, child: const Text('⬇️')),
              // SizedBox(height: 10,),
              FullScreenWidget(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  height: 200,
                  // padding: EdgeInsets.only(
                  //   top: 340,
                  // ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${ProductAttr.imageUrl}',
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: 15,
              //   top: 30,
              //   child: InkWell(
              //     onTap: (() {
              //       Navigator.of(context).pop();
              //     }),
              //     child: Container(
              //       padding: EdgeInsets.all(8),
              //       decoration: BoxDecoration(
              //           color:
              //               Color.fromARGB(255, 200, 188, 188).withOpacity(0.5),
              //           shape: BoxShape.circle),
              //       child: Icon(
              //         Icons.arrow_back_ios,
              //         color: Color.fromARGB(255, 0, 0, 0),
              //         size: 33,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${ProductAttr.title}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                InkWell(
                  onTap: () async => {
                    url = '${ProductAttr.imageUrl}.jpg',
                    await GallerySaver.saveImage(url,
                        albumName: 'E-football seller'),
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Downloaded successfully!')),
                    )
                  },
                  child: Container(
                    child: Icon(
                      Icons.download,
                      color: Color.fromARGB(255, 74, 203, 226),
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                InkWell(
                  onTap: () async => {
                //  final  urlImage = '${ProductAttr.imageUrl}.jpg',
                //    final  urlImage =  Uri.parse(url);
                  },
                  child: Container(
                    child: Icon(
                      Icons.share_sharp,
                      color: Color.fromARGB(255, 28, 164, 218),
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Container(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 1,
            ),
            child: Text(
              '${ProductAttr.description}',
              style: TextStyle(
                height: 1.3,
                fontSize: 15,
              ),
            ),
          ),
          // SizedBox(
          //   height: 4000,
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 133, 133, 133)),
                    ),
                    Text(
                      '${ProductAttr.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 9,
                ),
                Expanded(
                  child: Container(
                    height: 43,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            primary: Colors.black),
                        onPressed:
                            _cartProvider.getCartItem.containsKey(ProductId)
                                ? null
                                : () {
                                    _cartProvider.addProductToCart(
                                        ProductId,
                                        ProductAttr.price,
                                        ProductAttr.title,
                                        ProductAttr.imageUrl);
                                  },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _cartProvider.getCartItem.containsKey(ProductId)
                                  ? 'Already Added'
                                  : 'Add To Favourites',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(CupertinoIcons.heart)
                          ],
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
