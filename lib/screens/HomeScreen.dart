import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minimals/controllers/brand_controller.dart';
import 'package:minimals/models/brand_model.dart';
import 'package:minimals/screens/NewDiscoverScreen.dart';
import 'package:minimals/screens/product_list.dart';
import 'package:minimals/Helpers/ColorScheme.dart';
import 'package:minimals/Helpers/font_scheme.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'SearchScreen.dart';
import 'collection_detail_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenHeight;
  late double screenWidth;
  final List<String> imgList = [
    "asset/images/LUXE.png",
    "asset/images/SEASONS.png",
    "asset/images/ATHX.png"
  ];
  final List<String> imgnames = [
    "LUXE",
    "SEASONS",
    "ATHX"
  ];
  final List<String> categoryNames = ["WOMEN'S", "MEN'S", "ACCESSORIES"];
  late List<Widget> imageSliders;
  String greeting_test="";
   greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
     setState(() {
       greeting_test= 'Good Morning';
     });
    }
    else if (hour < 17) {
      setState(() {
        greeting_test= 'Good Afternoon';
      });

    }else{
      setState(() {
        greeting_test= 'Good Evening';
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    greeting();
    imageSliders = imgList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>DiscoverScreen(category: "mens")));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
        ),
      ),
    ))
        .toList();
  }
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 900),
      pageBuilder: (context, animation, secondaryAnimation) => const SearchScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );}
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 80),
        child: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(top:7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, Kaushik!", style: playTitle,),
                    Text("$greeting_test", style: playTitle.copyWith(
                      color: newTitleGrey
                    ),),
                  ],
                ),
                /*Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: newBabyYellow,
                    boxShadow: subtleShadow
                  ),
                  child: Row(
                    children: [
                      Image.asset("asset/images/home/searchIcon.png", width: 20, color: newDarkGrey,),
                      Container(
                        width: screenWidth*0.28,
                        height:40,
                      )
                    ],
                  ),
                ),*/
               // Image.asset("asset/images/home/searchIcon.png", width: 20, color: newDarkGrey,),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Row(

                    children: [
                      InkWell(
                          hoverColor: Colors.transparent,
                          highlightColor:Colors.transparent,
                          focusColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            Navigator.of(context).push(_createRoute());
                           /* Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  SearchScreen(
                                ))).then((value) {
                              //FocusScope.of(context).requestFocus(new FocusNode());
                            });*/
                          },
                          child: Image.asset("asset/images/home/searchIcon.png", width: 20, color: Colors.black,)),
                      SizedBox(width: 15,),
                      Container(
                          margin: EdgeInsets.only(right: 0),
                          child: Image.asset("asset/images/home/menu.png", color: Colors.black, width: 20,)
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),


        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [

              gap,
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset("asset/images/home/Top Holder.png", width: screenWidth*0.92,)
              ),
              gap,
              FutureBuilder<List<Brand>>(
                  future: BrandController().getBrandList(),
                  builder: (context, snapshot) {
                    if(snapshot.data?.length==0){
                      return  Container();
                    }
                    else if(snapshot.hasData){

                      return Container(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.55,
                              aspectRatio: 1.1,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              initialPage: 100,
                              autoPlay: false,

                            ),
                            items: List.generate(snapshot.data!.length, (index){
                              return Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                           image: DecorationImage(image: NetworkImage(snapshot.data![index].image),fit: BoxFit.cover)
                        ),
                                  child:Stack(
                                    children: [
                                      Container(


                                        margin: EdgeInsets.all(5.0),
                                        child: InkWell(
                                          onTap: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>DiscoverScreen(category: categoryNames[index])));
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>NewDiscover(title: snapshot.data![index].name,
                                           sub_title:snapshot.data![index].description , brand_id: snapshot.data![index].id,
                                            color: 'null',category: 'null',sizes: 'null',gender: 'null',prize: 'null',)));

                                          },
                                          /*child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              child: Image.network(snapshot.data![index].image, fit: BoxFit.cover, width: 1000.0)),*/
                                        ),
                                      ),
                                      Center(
                                        child: Text(snapshot.data![index].name, style: TextStyle(
                                            fontFamily: "adam",
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color:Colors.black,
                                            height: 0.7,
                                            letterSpacing: 5.9
                                        ),
                                        ),
                                      ),

                                    ],
                                  )
                              );
                            }),
                          ));

                    }
                    else{

                      return  Center(child: Padding(
                        padding: const EdgeInsets.only(left:18.0,right: 18,top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width:  (MediaQuery.of(context).size.width-48)/2,
                              height: 250,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10), )),

                                  child: Container(
                                    width:  (MediaQuery.of(context).size.width-48)/2,
                                    height: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10),)
                                    ),

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:  (MediaQuery.of(context).size.width-48)/2,
                              height: 250,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10), )),

                                  child: Container(
                                    width:  (MediaQuery.of(context).size.width-48)/2,
                                    height: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10),)
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    }
                  }),





              gap,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CollectionDetail()));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              child: Image.asset("asset/images/home/Essentials.png", width: screenWidth*0.5, height: screenWidth*0.6, fit: BoxFit.cover,)
                          ),
                        ),
                        gap,
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.asset("asset/images/home/Creators.png", width: screenWidth*0.5, height: screenWidth*0.7, fit: BoxFit.cover,)
                        ),

                      ],
                    )),
                    SizedBox(width:20),
                    Expanded(child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.asset("asset/images/home/Fragrances.png", width: screenWidth*0.5, height: screenWidth*0.7, fit: BoxFit.cover,)
                        ),
                        gap,
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.asset("asset/images/home/Luxe.png", width: screenWidth*0.5, height: screenWidth*0.6, fit: BoxFit.cover,)
                        ),

                      ],
                    ))
                  ],
                ),
              ),
              gap,
              Container(

                height: 260,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4,right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth*0.65,
                              height: 260,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.grey,

                                  image: DecorationImage(image: AssetImage('asset/images/home/Luxe.png'),fit: BoxFit.cover)
                              ),
                            ),


                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              gap,

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MENS", style: TextStyle(
                            fontFamily: 'popins-b',fontSize: 18
                        )),
                        Text("ESSENTIALS", style: TextStyle(
                            fontFamily: 'adam',fontSize: 14
                        )),
                      ],
                    ),
                  ),
                ],
              ),


              Container(

                  height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4,right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth*0.5,
                              height: 300,

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(image: AssetImage('asset/images/SEASONS.png'),fit: BoxFit.cover)
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4,),
                                Container(
                                  width: screenWidth*0.5,
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('SAVOIRE',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700),),

                                      Row(
                                        children: [
                                          Text('₹',style: TextStyle(fontFamily: 'adam',fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                          Text('2000.00',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0,),
                                Text('HOODIE',style: TextStyle(fontFamily: 'adam',fontSize: 11,color: Colors.grey),)
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),


              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("WOMENS", style: TextStyle(
                            fontFamily: 'popins-b',fontSize: 18
                        )),
                        Text("ESSENTIALS", style: TextStyle(
                            fontFamily: 'adam',fontSize: 14
                        )),
                      ],
                    ),
                  ),
                ],
              ),


              Container(

                height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4,right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth*0.5,
                              height: 300,

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(image: AssetImage('asset/images/Layer 31.png'),fit: BoxFit.cover)
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4,),
                                Container(
                                  width: screenWidth*0.5,
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('SAVOIRE',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700),),

                                      Row(
                                        children: [
                                          Text('₹',style: TextStyle(fontFamily: 'adam',fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                          Text('2000.00',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0,),
                                Text('HOODIE',style: TextStyle(fontFamily: 'adam',fontSize: 11,color: Colors.grey),)
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TOP TRENDING", style: TextStyle(
                            fontFamily: 'popins-b',fontSize: 18
                        )),
                        Text("COLLECTIONS", style: TextStyle(
                            fontFamily: 'adam',fontSize: 14
                        )),
                      ],
                    ),
                  ),
                ],
              ),


              Container(

                height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4,right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth*0.5,
                              height: 300,

                              decoration: BoxDecoration(
                              color: Colors.grey,
                                image: DecorationImage(image: AssetImage('asset/images/ATHX.png'),fit: BoxFit.cover)
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4,),
                                Container(
                                  width: screenWidth*0.5,
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('SAVOIRE',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700),),

                                      Row(
                                        children: [
                                          Text('₹',style: TextStyle(fontFamily: 'adam',fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                          Text('2000.00',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0,),
                                Text('HOODIE',style: TextStyle(fontFamily: 'adam',fontSize: 11,color: Colors.grey),)
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              gap,
              gap,
              gap,
              gap,
              gap,
              gap,

            ],
          ),
        ),
      ),
    );
  }
  SizedBox gap = SizedBox(height:15,width: 15,);
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}