import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/controllers/product_controller.dart';
import 'package:minimals/models/products_model.dart';
import 'package:minimals/screens/FilterScreen.dart';
import 'package:minimals/screens/ProductDetail.dart';
import 'package:minimals/screens/product_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'HomeScreen.dart';

class NewDiscover extends StatefulWidget {
  final String title;
  final String sub_title;
  final String brand_id;
  var category;
  var gender;
  var color;
  var sizes;
  var prize;

  NewDiscover({required this.title,required this.sub_title,required this.brand_id,required this.category,required this.gender
  ,required this.color,required this.sizes,required this.prize});

  @override
  _NewDiscoverState createState() => _NewDiscoverState();
}

class _NewDiscoverState extends State<NewDiscover> {

  late double screenWidth;
  late double screenHeight;
  final List<String> imgList = [
    "asset/images/Mens 2.jpeg",
    "asset/images/Mens 3.jpeg",
    "asset/images/Womens 1.jpeg",
    "asset/images/Womens 3.jpeg",
    "asset/images/Womens 4.jpeg"
  ];
  var product_id='';
  var product_prize='';
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return  Scaffold(
     /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title,style: TextStyle(
            fontFamily: "adam",
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color:Colors.black,
            height: 0.7,
            letterSpacing: 5.9
        ),),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,)
        ),
      ),*/
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Container(
          height: screenHeight,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          //color: Colors.deepOrangeAccent.withOpacity(0.5),

                            child: CarouselSlider(
                              options: CarouselOptions(
                                  viewportFraction: 1,
                                  aspectRatio: 0.7,
                                  enlargeCenterPage: false,
                                  enableInfiniteScroll: true,
                                  initialPage: 100,
                                  autoPlay: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentPos = index;
                                    });
                                  }

                              ),
                              items: List.generate(imgList.length, (index){
                                return Container(
                                  /*decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(20,20),
                                  blurRadius: 1,
                                  spreadRadius: 1
                              )]
                          ),*/
                                    child:Container(

                                      margin: EdgeInsets.all(0.0),
                                      child: InkWell(
                                        onTap: (){
                                          // Navigator.push(context, MaterialPageRoute(builder: (_)=>DiscoverScreen(category: categoryNames[index])));


                                        },
                                        child: Image.asset(imgList[index], fit: BoxFit.cover, width: 1000.0),
                                      ),
                                    )
                                );
                              }),
                            )),

                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: screenWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:18.0,bottom: 15),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.sub_title,style: TextStyle(
                                          fontFamily: "popins-s",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color:Colors.black,
                                          height: 0.7,
                                          //letterSpacing: 5.9
                                        ),),
                                        SizedBox(height: 5,),
                                        Text(widget.title,style: TextStyle(
                                          fontFamily: "popins-b",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          color:Colors.black,
                                          height: 0.7,
                                          //letterSpacing: 5.9
                                        ),),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: imgList.map((url) {
                                            int index = imgList.indexOf(url);
                                            return currentPos == index?
                                            Container(
                                              width: 26.0,
                                              height: 8.0,
                                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                // shape: BoxShape.circle,
                                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                                color: /*currentPos == index
                                              ? Color.fromRGBO(0, 0, 0, 0.9)
                                              :*/ Color.fromRGBO(0, 0, 0, 0.4),
                                              ),
                                            ):Container(
                                              width: 8.0,
                                              height: 8.0,
                                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: /*currentPos == index
                                              ? Color.fromRGBO(0, 0, 0, 0.9)
                                              :*/ Color.fromRGBO(0, 0, 0, 0.4),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ]
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0,bottom: 15),
                                  child: InkWell(
                                    onTap: (){
                                      if(product_id==''){
                                        Fluttertoast.showToast(msg: 'No Product');
                                      }else{
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(
                                          product_id: product_id,
                                          title: widget.title,
                                            subtitle: widget.sub_title,
                                          prize: product_prize,
                                        )));
                                      }

                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          boxShadow: [BoxShadow(
                                              color: Colors.black.withOpacity(0.3),
                                              offset: Offset(2,2),
                                              blurRadius: 7,
                                              spreadRadius: 1
                                          )],
                                          shape: BoxShape.circle,
                                          color: Colors.black
                                      ),
                                      child: Center(
                                        child: Icon(Icons.arrow_forward,color: Colors.white,size: 22,),
                                      ),
                                    ),
                                  ),
                                )
                              ],


                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          hoverColor: Colors.transparent,
                          highlightColor:Colors.transparent,
                          focusColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: ()async{
                            SharedPreferences prefs=await SharedPreferences.getInstance();
                            Navigator.of(context).push(_createRoute()).then((value) {
                              setState(() {
                                print('<<<<>><>>>>>>>>>>>><>>>>>>>>>>>>>>>>>>>>>');
                               widget.sizes= prefs.getString('size');
                               widget.category=prefs.getString('categ');
                               widget.prize=prefs.getString('prize');
                              });
                            });
                            // Navigator.pushNamed(context, '/filterpage');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Icon(Icons.tune_rounded,size: 25,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:7.0,left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              InkWell(
                                hoverColor: Colors.transparent,
                                highlightColor:Colors.transparent,
                                focusColor:Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: (){
                                  setState(() {
                                    selected_category='all';
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text('ALL',style: TextStyle(
                                        fontFamily: "adam",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color:selected_category=='all'?Colors.black:Colors.grey,
                                        height: 0.7,
                                        letterSpacing: 1.2

                                    ),),
                                    selected_category=='all'?
                                    Column(
                                      children: [
                                        SizedBox(height: 4,),
                                        Container(
                                          height: 5,width: 5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black
                                          ),
                                        )
                                      ],
                                    ):Container()
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                hoverColor: Colors.transparent,
                                highlightColor:Colors.transparent,
                                focusColor:Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: (){
                                  setState(() {
                                    selected_category='mens';
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text("MENS",style: TextStyle(
                                        fontFamily: "adam",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color:selected_category=='mens'?Colors.black:Colors.grey,
                                        height: 0.7,
                                        letterSpacing: 1.2

                                    ),),
                                    selected_category=='mens'?
                                    Column(
                                      children: [
                                        SizedBox(height: 4,),
                                        Container(
                                          height: 5,width: 5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black
                                          ),
                                        )
                                      ],
                                    ):Container()
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                hoverColor: Colors.transparent,
                                highlightColor:Colors.transparent,
                                focusColor:Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: (){
                                  setState(() {
                                    selected_category='womens';
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text("WOMENS",style: TextStyle(
                                        fontFamily: "adam",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color:selected_category=='womens'?Colors.black:Colors.grey,
                                        height: 0.7,
                                        letterSpacing: 1.2

                                    ),),
                                    selected_category=='womens'?
                                    Column(
                                      children: [
                                        SizedBox(height: 4,),
                                        Container(
                                          height: 5,width: 5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black
                                          ),
                                        )
                                      ],
                                    ):Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,

                          child: Transform.scale(

                            scale: 0.6,
                            child: CupertinoSwitch(

                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              //activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder<List<Product>>(
                        future: ProductController().getProductList(widget.brand_id,
                            widget.category,widget.gender,widget.color,widget.sizes,widget.prize),
                        builder: (context, snapshot) {
                          if(snapshot.data?.length==0){
                            return  Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('No Products'),),
                            ));
                          }
                          else if(snapshot.hasData){
                            product_id=snapshot.data![0].id;
                            product_prize=snapshot.data![0].price;

                            return  ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7,right: 8,bottom: 8,top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:( screenWidth-20)/2,
                                              height: 300,

                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  image: DecorationImage(image: NetworkImage(snapshot.data![index].image),fit: BoxFit.cover)
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 4,),
                                                Container(
                                                  width:( screenWidth-20)/2,
                                                  child: Row(

                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(snapshot.data![index].name,style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700),),

                                                      Row(
                                                        children: [
                                                          Text('₹',style: TextStyle(fontFamily: 'adam',fontSize: 15.5,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                                          Text(snapshot.data![index].price,style: TextStyle(fontFamily: 'popins-s',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 0,),
                                                //Text('WINTER HOODIE',style: TextStyle(fontFamily: 'adam',fontSize: 11,color: Colors.grey),)
                                              ],
                                            ),

                                          ],
                                        ),
                                        index+1==snapshot.data!.length?Container():
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:( screenWidth-20)/2,
                                              height: 300,

                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  image: DecorationImage(image: isSwitched?AssetImage(image1):AssetImage(image2),fit: BoxFit.cover)
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 4,),
                                                Container(
                                                  width:( screenWidth-20)/2,
                                                  child: Row(

                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('SAVOIRE',style: TextStyle(fontFamily: 'adam',fontSize: 14,fontWeight: FontWeight.w700),),

                                                      Row(
                                                        children: [
                                                          Text('₹',style: TextStyle(fontFamily: 'adam',fontSize: 15.5,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                                          Text('2999.00',style: TextStyle(fontFamily: 'popins-s',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.8)),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 0,),
                                                Text('WINTER HOODIE',style: TextStyle(fontFamily: 'adam',fontSize: 11,color: Colors.grey),)
                                              ],
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),


                            );

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

                    Container(height: 10,)


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18,left: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,)
                    ),

                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
  var selected_category='all';
  int currentPos = 0;
  bool isSwitched = false;
  var image1="asset/images/Womens 1.jpeg";
  var image2="asset/images/LUXE.png";
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 900),
      pageBuilder: (context, animation, secondaryAnimation) =>  FilterScreen(title: widget.title,sub_title: widget.sub_title,brand_id: widget.brand_id,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );}
}
