import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'HomeScreen.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({Key? key}) : super(key: key);

  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Search Results",style: TextStyle(fontFamily: 'popins-s',color: Colors.black),),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,)
        ),
      ),
      body:  ScrollConfiguration(
        behavior: MyBehavior(),
        child: Container(
            height: screenHeight,
            child:  SingleChildScrollView(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  SizedBox(height: 0,),
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
                                    width:( screenWidth-20)/2,
                                    height: 300,

                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(image: AssetImage('asset/images/LUXE.png'),fit: BoxFit.cover)
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:( screenWidth-20)/2,
                                    height: 300,

                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(image: AssetImage("asset/images/LUXE.png"),fit: BoxFit.cover)
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


                  ),
                  Container(height: 10,
                    /*  child: Center(
                      child:  Text('MINIMALS',style:TextStyle(
                          fontFamily: "adam",
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color:Colors.grey,
                          height: 0.7,
                          letterSpacing: 8.7

                      ),),
                    ),*/),

                ],
              ),
            ),
        ),
      ),
    );
  }
}
