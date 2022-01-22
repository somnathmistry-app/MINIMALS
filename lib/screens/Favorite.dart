import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'HomeScreen.dart';
class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late double screenWidth;
  late double screenHeight;
bool is_fav=true;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
automaticallyImplyLeading: false,
       /* leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          //Navigator.pop(context);
        },),*/
        centerTitle: true,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("My Favourites", style: TextStyle(
                  fontFamily: "popins-b",
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                height: 0.7
              ),),
              SizedBox(height: 4,),
              Container(
                height: 5,width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),),
              /*Text("Your Top Choices", style: TextStyle(
                  fontFamily: "popins-r",
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  height: 0.7
              ),),*/
            ],
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(

                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                itemCount: 10,
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
                                width:( screenWidth-24)/2,
                                height: 300,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(image: AssetImage('asset/images/Womens 1.jpeg'),fit: BoxFit.cover)
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

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
                                            child: Container(
                                              height: 25,width: 25,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                                ),
                                              child: Center(
                                                child:is_fav?Icon(Icons.favorite,color: Colors.red,size: 18,):
                                                Icon(Icons.favorite_border,color: Colors.black,size: 18,),

                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4,),
                                  Container(
                                    width:( screenWidth-24)/2,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:( screenWidth-24)/2,
                                height: 300,

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(image: AssetImage("asset/images/Womens 1.jpeg"),fit: BoxFit.cover)
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

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
                                            child: Container(
                                              height: 25,width: 25,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                              ),
                                              child: Center(
                                                child:is_fav?Icon(Icons.favorite,color: Colors.red,size: 18,):
                                                Icon(Icons.favorite_border,color: Colors.black,size: 18,),

                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4,),
                                  Container(
                                    width:( screenWidth-24)/2,
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


              ),
              SizedBox(height: 90,)
            ],
          ),

        ),
      )
    );
  }
}
