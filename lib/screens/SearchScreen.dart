import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:minimals/screens/SearchDetail.dart';

import 'HomeScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double screenWidth;
  late double screenHeight;
  var search_text=TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(18),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       InkWell(
                           hoverColor: Colors.transparent,
                           highlightColor:Colors.transparent,
                           focusColor:Colors.transparent,
                           splashColor: Colors.transparent,
                           onTap: (){
                             Navigator.pop(context);
                           },
                           child: Icon(Icons.close, color: Colors.black,)
                       ),
                     ],
                   ),

                   SizedBox(height: 20,),
                   Text("Explore", style: TextStyle(
                       fontFamily: "popins-s",
                       fontSize: 28,
                       fontWeight: FontWeight.w900,
                       color: Colors.black,
                       height: 0.7,
                       letterSpacing: 0.1
                   ),),
                   SizedBox(height: 20,),
                   Container(
                     height: 50,
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       /* border: Border.all(color: Color(0xffD8DBE3),
                        width: 1),*/
                         color: Colors.grey.withOpacity(0.2),
                         /* boxShadow: [new BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 1.0,
                            spreadRadius: 1,
                            offset: Offset(0,5)
                        ),],*/
                         borderRadius: BorderRadius.all(Radius.circular(12))),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         TextField(
                           controller: search_text,
                           onSubmitted: (val){
                             Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) =>  SearchDetail(
                                 ))).then((value) {
                               FocusScope.of(context).requestFocus(new FocusNode());
                             });
                           },
                           decoration: InputDecoration(border: InputBorder.none,
                             hintText: 'Search',
                             prefixIcon: Icon(Icons.search,color: Color(0xff5C6074),),
                             hintStyle: TextStyle(fontFamily: 'popins-r',color: Colors.grey.withOpacity(0.5)),

                           ),
                           style: TextStyle(fontFamily: 'popins-r',color: Colors.black),

                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 25,),
                   Padding(
                     padding: const EdgeInsets.only(left:8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Search Suggestions", style: TextStyle(
                             fontFamily: "popins-r",
                             fontSize: 12,
                             fontWeight: FontWeight.w900,
                             color: Colors.black,
                             height: 0.7
                         ),),
                         SizedBox(height: 15,),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("Wallets", style: TextStyle(
                                 fontFamily: "popins-r",
                                 fontSize: 10,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.grey,
                                 height: 0.7
                             ),),
                             Icon(Icons.arrow_forward,color: Colors.grey,size: 15,)
                           ],
                         ),
                         Divider(),
                         SizedBox(height: 5,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("Shirts", style: TextStyle(
                                 fontFamily: "popins-r",
                                 fontSize: 10,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.grey,
                                 height: 0.7
                             ),),
                             Icon(Icons.arrow_forward,color: Colors.grey,size: 15,)
                           ],
                         ),
                         Divider(),
                         SizedBox(height: 5,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("Hoodies", style: TextStyle(
                                 fontFamily: "popins-r",
                                 fontSize: 10,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.grey,
                                 height: 0.7
                             ),),
                             Icon(Icons.arrow_forward,color: Colors.grey,size: 15,)
                           ],
                         ),
                         Divider(),
                       ],
                     ),
                   ),

                 ],
               ),
             ),
          /*   Expanded(
                 child:
                     search_text.text==null||search_text.text==""?Container():
                 StaggeredGridView.countBuilder(
                   padding: EdgeInsets.only(left: 8,right: 8),
                   physics: AlwaysScrollableScrollPhysics(),
                   shrinkWrap: true,
                   crossAxisCount: 4,
                   itemCount: 10,
                   itemBuilder: (BuildContext context, int index) =>
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: screenWidth*0.5,
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
                                 width: screenWidth*0.5,
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

                   staggeredTileBuilder: (int index) =>
                   new StaggeredTile.count(2, 3.8),
                   mainAxisSpacing: 5.0,
                   crossAxisSpacing: 5.0,
                 ),
             )*/
           ],
          ),
        )
    );
  }
}
