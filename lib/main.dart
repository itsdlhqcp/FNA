import 'package:efotballactseller_app/onboard/onboard.dart';
import 'package:efotballactseller_app/onboard/splash_screen.dart';
import 'package:efotballactseller_app/views/screens/auth/login_screen.dart';
import 'package:efotballactseller_app/views/screens/bottom_navbar.dart';
import 'package:efotballactseller_app/views/screens/detail/detail_page.dart';
import 'package:efotballactseller_app/views/screens/feeds_category.dart';
import 'package:efotballactseller_app/views/screens/home_screens.dart';
import 'package:efotballactseller_app/views/screens/provider/cart_provider.dart';
import 'package:efotballactseller_app/views/screens/provider/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],

      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-FOOTBALL SHOP',
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: backgroundColor,
        // ),
         

                
        // home:  isviewed != 0 ? OnBoard()  : splashScreen()
        
       home: isviewed != 0 ? OnBoard()  :StreamBuilder(             
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapShot) {
              if (userSnapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (userSnapShot.connectionState ==
                  ConnectionState.active) {
                if (userSnapShot.hasData) {
                  return BottomNavBar();
                } else {
                  return LoginScreen();
                }
              } else if (userSnapShot.hasError) {
                return Center(
                  child: Text('something went wrong'),
                );
              }
              return Container();
            }) ,
        routes: {
          DetailPage.id: (context) => DetailPage(),
          FeedsCategoryScreen.id: ((context) => FeedsCategoryScreen()),
        },
       
      ),
    );
    
  }
}


