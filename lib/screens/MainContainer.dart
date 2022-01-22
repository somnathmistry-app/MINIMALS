import 'package:flutter/material.dart';
import 'package:minimals/screens/Account.dart';
import 'package:minimals/Helpers/ColorScheme.dart';
import 'package:minimals/screens/Favorite.dart';
import 'package:minimals/screens/HomeScreen.dart';
import 'package:minimals/screens/Randomiser.dart';
import 'package:minimals/screens/ShoppingBag.dart';

import 'lets_shuffle.dart';
class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer>  with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int currentTab = 0;
  var screens = [
    HomeScreen(),
    Favorite(),
    Randomiser(),
    ShoppingBag(),
    Account(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._tabController =
        TabController(initialIndex: 0, length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            screens[currentTab],
            Positioned(
              left:0,
              right:0,
              bottom:0,
              child: Container(
                //color: ThemeData.light().scaffoldBackgroundColor,
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color:  Colors.black,
                      /*boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0,2),
                          blurRadius: 5,
                          spreadRadius: 5
                      )]*/
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          radius: 30,
                          onTap: (){
                            setState(() {
                              currentTab = 0;
                            });
                          },
                          child: Image.asset("asset/images/icons/home.png", color: currentTab == 0 ?newPink:Colors.grey,width: 20,)
                      ),
                      InkWell(
                          radius: 30,
                          onTap: (){
                            setState(() {
                              currentTab = 1;
                            });
                          },
                          child: Image.asset("asset/images/icons/like.png", color: currentTab == 1 ?newPink:Colors.grey, width: 20,)
                      ),
                      InkWell(
                          radius: 30,
                          onTap: (){
                            // setState(() {
                            //   currentTab = 2;
                            // });
                            Navigator.push(context, MaterialPageRoute(
                                builder: (_)=>LetsShuffle()
                            ));
                            //Navigator.pushNamed(context, '/randomiser');
                          },
                          child: Image.asset("asset/images/icons/random.png", color: currentTab == 2 ?newPink:Colors.grey, height: 30)
                      ),
                      InkWell(
                          radius: 30,
                          onTap: (){
                           /* setState(() {
                              currentTab = 3;
                            });*/
                            Navigator.push(context, MaterialPageRoute(
                                builder: (_)=>ShoppingBag()
                            ));
                          },
                          child: Image.asset("asset/images/icons/shopping-bag.png", color: currentTab == 3 ?newPink:Colors.grey, width: 20)
                      ),
                      InkWell(
                          radius: 30,
                          onTap: (){
                            /*setState(() {
                              currentTab = 4;
                            });*/
                            Navigator.push(context, MaterialPageRoute(
                                builder: (_)=>Account()
                            ));
                          },
                          child: Image.asset("asset/images/icons/user.png", color: currentTab == 4 ?newPink:Colors.grey, width: 20)
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
