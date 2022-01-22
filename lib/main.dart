import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimals/screens/Account.dart';
import 'package:minimals/screens/AccountDetails.dart';
import 'package:minimals/screens/Addresses.dart';
import 'package:minimals/screens/Credits.dart';
import 'package:minimals/screens/FilterScreen.dart';
import 'package:minimals/screens/Randomiser.dart';
import 'package:minimals/screens/RandomiserGender.dart';
import 'package:minimals/screens/landing_page.dart';
import 'package:minimals/screens/product_list.dart';
import 'package:minimals/screens/HomeScreen.dart';
import 'package:minimals/screens/MainContainer.dart';
import 'package:minimals/screens/MyOrderScreen.dart';
import 'package:minimals/screens/Notifications.dart';
import 'package:minimals/screens/OrderDetails.dart';
import 'package:minimals/screens/ProductDetail.dart';
import 'package:minimals/screens/Returns.dart';
import 'package:minimals/screens/ShoppingBag.dart';
import 'package:minimals/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(



      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        fontFamily: "play"
      ),
      home: SplashScreen(),
      routes: {
        "/mainContainer":(_)=>MainContainer(),
        "/homeScreen":(_)=>HomeScreen(),
        //"/discoverScreen":(_)=>DiscoverScreen(category: "mens",),
        //"/productDetail":(_)=>ProductDetail(),
        "/shoppingBag":(_)=>ShoppingBag(),
        "/account":(_)=>Account(),
        "/myOrder":(_)=>MyOrderScreen(),
        "/addresses":(_)=>Addresses(),
        '/accountDetails':(_)=>AccountDetails(),
        '/credits':(_)=>Credits(),
        '/notifications':(_)=>Notifications(),
        '/returns':(_)=>Returns(),
        '/orderDetails':(_)=>OrderDetails(),
        '/randomiser':(_)=>Randomiser(),
        '/randomiserGender':(_)=>RandomiserGender(),
        '/landingpage':(_)=>LandingPage(),
        //'/filterpage':(_)=>FilterScreen()
      },
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
