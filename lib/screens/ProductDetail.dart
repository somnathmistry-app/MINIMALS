import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/Helpers/ColorScheme.dart';
import 'package:minimals/Helpers/font_scheme.dart';
import 'package:minimals/controllers/add_to_cart_controller.dart';
import 'package:minimals/controllers/login_controller.dart';
import 'package:minimals/controllers/product_detail_controller.dart';
import 'package:minimals/controllers/size_controller.dart';
import 'package:minimals/models/product_detail_model.dart';
import 'package:minimals/models/size_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'HomeScreen.dart';
class ProductDetail extends StatefulWidget {
  var product_id;
  var title,subtitle,prize;
   ProductDetail({required this.product_id,required this.title,required this.subtitle,required this.prize});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> imgList = [
    "asset/images/Mens 2.jpeg",
    "asset/images/Mens 3.jpeg",
    "asset/images/Womens 1.jpeg",
    "asset/images/Womens 3.jpeg",
    "asset/images/Womens 4.jpeg"
  ];
  late double screenHeight;
  late double screenWidth;
  late List<Widget> imageSliders;
  final CarouselController _controller = CarouselController();
  int _current = 0;
  String _selectedQuantity = '1';
  List<String> _quantity = ['1','2','3','4'];

  late bool is_logged_in;
  check_login()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();

    setState(() {
      is_logged_in=prefs.getBool('isLoggedIn')??false;
      print(is_logged_in);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      check_login();
    imageSliders = imgList.map((item) => Container(

      padding: EdgeInsets.symmetric(horizontal:0.0, vertical: 0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          width: 1000,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  spreadRadius: 4,
                  blurRadius: 4

              )],
            image: DecorationImage(
              image: AssetImage(item),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter
            )
          ),
        ),
      ),
    ))
        .toList();
  }
  bool is_fav=false;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: //Image.asset("asset/images/AppLogo.png", width: 130,),
        Text('MINIMALS',style:TextStyle(
            fontFamily: "adam",
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color:Colors.black,
            height: 0.7,
            letterSpacing: 5.7

        ),),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)
        ),
        actions: [
          InkWell(
            hoverColor: Colors.transparent,
            highlightColor:Colors.transparent,
            focusColor:Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              setState(() {
                is_fav=!is_fav;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right:18.0),
              child:is_fav?Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border,color: Colors.black,),
            ),
          )
        ],
      ),
      body:  ScrollConfiguration(
        behavior: MyBehavior(),
        child: SlidingUpPanel(

          minHeight: MediaQuery.of(context).size.height*0.275,
          maxHeight: MediaQuery.of(context).size.height*0.85,

          panelBuilder: (sc) => _panel(sc),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: List.generate(imgList.length, (index){
                      return Container(

                        padding: EdgeInsets.symmetric(horizontal:4.0, vertical: 0),
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: 1000,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                boxShadow: [BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    spreadRadius: 4,
                                    blurRadius: 4

                                )],
                                image: DecorationImage(
                                    image: AssetImage(imgList[index]),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter
                                )
                            ),
                          ),
                        ),
                      );
                    }),
                    carouselController: _controller,
                    options: CarouselOptions(
                        viewportFraction: 0.85,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: false,
                        aspectRatio: 0.75,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),




                ],
              ),
            ),
          ),
          backdropEnabled: false,
          boxShadow: [],
          border: Border.all(color: Colors.transparent),
        ),

      ),


    );
  }
  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child:SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                      backgroundColor: Colors.white,
                      content: Column(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
                  ),
                ],
              ),
            )
        );
      },
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("login"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        showLoadingIndicator();
        LoginController().postLogin('tester_minimals@gmail.com', '123456', '1234').then((value) {

            Navigator.of(context, rootNavigator: true).pop();
            setState(() {
              check_login();
            });
            Fluttertoast.showToast(msg: 'Logged in');


        });
      },
    );
    Widget cancelButton = TextButton(
      child: Text("not now"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Not Logged in"),
      content: Text("Login to continue"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child:  ListView(
          controller: sc,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 5,width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 18,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,style: TextStyle(fontFamily: 'popins-b',fontSize: 22,height: 0.7),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("₹",style: TextStyle(fontFamily: 'adam',fontSize: 20,height: 0.7),),
                          Text(widget.prize,style: TextStyle(fontFamily: 'popins-s',fontSize: 16,height: 0.7),),
                        ],
                      ),
                      Text("MRP Incl. of all taxes",style: TextStyle(fontFamily: 'popins-r',fontSize: 10,height: 0.7),),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6,left: 18),
              child: Text(widget.subtitle,style: TextStyle(fontFamily: 'popins-s',fontSize: 16,height: 0.7),),
            ),


            FutureBuilder<List<Sizes>>(
                future: SizeController().getSizeList(),
                builder: (context, snapshot) {
                  if(snapshot.data?.length==0){
                    return  Container();
                  }
                  else if(snapshot.hasData){


                    return   Center(
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              hoverColor: Colors.transparent,
                              highlightColor:Colors.transparent,
                              focusColor:Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: (){
                                setState(() {
                                  selected_size_index=int.parse(snapshot.data![index].id.toString());
                                });
                              },
                              child: Padding(
                                padding: index!=snapshot.data!.length-1? EdgeInsets.only(right:18.0):EdgeInsets.all(0),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selected_size_index==int.parse(snapshot.data![index].id.toString())?Colors.black:Colors.white
                                  ),
                                  child: Center(
                                    child: Text(snapshot.data![index].name.substring(0,1).toUpperCase(), style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: selected_size_index==int.parse(snapshot.data![index].id.toString())?Colors.white:Colors.grey.withOpacity(0.7),
                                        fontFamily: "popins-r"
                                    ),),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );

                  }
                  else{

                    return  Center(child: Padding(
                      padding: const EdgeInsets.only(left:18.0,right: 18,top: 18),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:  MediaQuery.of(context).size.width-48,
                            height: 50,
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
            Center(
              child: NeumorphicButton(


                onPressed: () async{
                  if(is_logged_in==false){
                    showAlertDialog(context);

                  }else{
                    showLoadingIndicator();
                    var response= await AddToCartController().addToCart(widget.product_id, selected_size_index);
                    if(response=='success'){
                      Navigator.of(context, rootNavigator: true).pop();
                      Fluttertoast.showToast(msg: 'Item Added to Cart');
                      Navigator.pushReplacementNamed(context, "/mainContainer");
                    }else{
                      Navigator.of(context, rootNavigator: true).pop();
                      Fluttertoast.showToast(msg: '$response');
                    }
                  }

                },
                style: NeumorphicStyle(
                    depth: 10,
                    intensity: 0.86,
                    surfaceIntensity: 0.5,
                    shape: NeumorphicShape.flat,
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(40),),
                    color: Colors.black,

                    shadowLightColor: Colors.white
                ),
                //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("asset/images/icons/add-to-basket.png", color: Colors.white,width: 20,),
                    SizedBox(width:10),
                    Text("Add to bag", style: TextStyle(
                        color: Colors.white,
                        fontFamily: "gotham",
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                  ],
                ),),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('DESCRIPTION',style: TextStyle(fontSize: 16,fontFamily: 'popins-b'),),
            ),

            Padding(
              padding: const EdgeInsets.only(left:18.0,right: 18,top: 5),
              child: Text('when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: TextStyle(fontFamily: 'popins-r',fontSize: 13,height: 1.2),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Row(
                children: [
                  Text('COLOR ',
                    style: TextStyle(fontFamily: 'popins-s',fontSize: 13,height: 1.2),),
                  Text('WHITE',
                    style: TextStyle(fontFamily: 'popins-s',fontSize: 13,height: 1.2,color: Colors.grey),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Row(
                children: [
                  Text('PRODUCT ID ',
                    style: TextStyle(fontFamily: 'popins-s',fontSize: 13,height: 1.2),),
                  Text('123456',
                    style: TextStyle(fontFamily: 'popins-s',fontSize: 13,height: 1.2,color: Colors.grey),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Row(
                children: [
                  Text('Shipping Availability',
                    style: TextStyle(fontFamily: 'popins-s',fontSize: 13,height: 1.2),),
                  ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0,right: 18,top: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),

                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:18.0),
                        child: Text('CHECK',style: TextStyle(fontWeight: FontWeight.w700),),
                      ),
                    ],
                  )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Text('Please enter pincode to check delivery options',
                style: TextStyle(fontSize: 12,height: 1.2),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('SIMILAR RECOMMENDATIONS',style: TextStyle(fontSize: 16,fontFamily: 'popins-b'),),
            ),
            SizedBox(height: 20,),
            Container(

              height: 350,
              child: Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
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
            SizedBox(height: 20,),
            /* Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('DETAILS',style: TextStyle(fontSize: 16,fontFamily: 'popins-b'),),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top:7.0,left: 18,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  InkWell(
                    hoverColor: Colors.transparent,
                    highlightColor:Colors.transparent,
                    focusColor:Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        selected_category='DETAILS';
                        selected_cat_text=detail;
                      });
                    },
                    child: Column(
                      children: [
                        Text('DETAILS',style: TextStyle(
                            fontSize: 16,fontFamily: 'popins-b',
                            fontWeight: FontWeight.w700,
                            color:selected_category=='DETAILS'?Colors.black:Colors.grey,
                            height: 0.7,
                            letterSpacing: 1.2

                        ),),
                        selected_category=='DETAILS'?
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
                        selected_category='SHIPPING';
                        selected_cat_text=shipping;
                      });
                    },
                    child: Column(
                      children: [
                        Text("SHIPPING",style: TextStyle(
                            fontSize: 16,fontFamily: 'popins-b',
                            fontWeight: FontWeight.w700,
                            color:selected_category=='SHIPPING'?Colors.black:Colors.grey,
                            height: 0.7,
                            letterSpacing: 1.2

                        ),),
                        selected_category=='SHIPPING'?
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
                        selected_category='RETURNS';
                        selected_cat_text=returns;
                      });
                    },
                    child: Column(
                      children: [
                        Text("RETURNS",style: TextStyle(
                            fontSize: 16,fontFamily: 'popins-b',
                            fontWeight: FontWeight.w400,
                            color:selected_category=='RETURNS'?Colors.black:Colors.grey,
                            height: 0.7,
                            letterSpacing: 1.2

                        ),),
                        selected_category=='RETURNS'?
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
            Padding(
              padding: const EdgeInsets.only(top:7.0,left: 18,right: 18),
              child: Text('$selected_cat_text',
                style: TextStyle(fontFamily: 'popins-r',fontSize: 13,height: 1.2),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('YOU MAY ALSO LIKE',style: TextStyle(fontSize: 16,fontFamily: 'popins-b'),),
            ),
            SizedBox(height: 20,),
            Container(

              height: 350,
              child: Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
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
            SizedBox(height: 20,),
          ],
        ),


    );
  }
  var selected_category='DETAILS';
  var selected_size_index=0;
  List<String>sizes=["XS","S","M","L","XL"];
  String selected_cat_text= 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  String detail='Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
String shipping="Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.";
String returns="There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
}

