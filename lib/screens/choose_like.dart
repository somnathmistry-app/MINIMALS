import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vibration/vibration.dart';

import 'DiscoverCollection.dart';
import 'DiscoverMinimals.dart';
import '../Helpers/font_scheme.dart';
import 'RandomiserGender.dart';
class ChooseLike extends StatefulWidget {
  ChooseLike({required this.navigate_page});
  String navigate_page;

  @override
  _ChooseLikeState createState() => _ChooseLikeState();
}

class _ChooseLikeState extends State<ChooseLike> {
 Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RandomiserGender(),
      ),
    );
    return true; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e9ed),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const RandomiserGender(),
              ),
            );
            //Navigator.pop(context);
          },
        ),

      ),
      body: WillPopScope(
        onWillPop:_willPopCallback ,
        child: Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.12,),
              Text("What would you like ?",
                style:TextStyle(fontSize: 22,color: Colors.black,fontFamily: 'basker'),
                textAlign: TextAlign.center,),
              Expanded(
               child: Column(
                 children: [
                   SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                   Container(
                     height: MediaQuery.of(context).size.height*0.25,
                     child: CupertinoPicker(
                       useMagnifier: true,
                       scrollController: FixedExtentScrollController(initialItem: 1),
                       magnification: 2,
                       selectionOverlay: Container(),
                       looping:true ,
                       //diameterRatio: 12,
                        backgroundColor: Color(0xffe8e9ed),
                       onSelectedItemChanged: (int value) async {
                         print('xsxsxsxsxsxsxsxsxsxsxsxsxsxsxs');
                           Vibration.vibrate();

                         //HapticFeedback.heavyImpact();
                       },
                       itemExtent: 30,
                       children: [
                         Text('Meeting outfits',style: TextStyle(fontFamily: 'basker'),),
                         Text('Airport looks',style: TextStyle(fontFamily: 'basker'),),
                         Text('Casuals',style: TextStyle(fontFamily: 'basker'),),
                         Text('Fine Dining',style: TextStyle(fontFamily: 'basker'),),
                         Text('Workouts',style: TextStyle(fontFamily: 'basker'),),
                       ],
                       squeeze: 0.9,
                     ),
                   ),
                 ],
               )
              ),
              NeumorphicButton(

                  margin: EdgeInsets.symmetric(vertical: 30),
                  onPressed: () {
                    if(widget.navigate_page=="DiscoverMinimals"){
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const DiscoverMinimals(),
                        ),
                      );
                    }else{
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const DiscoverCollection(),
                        ),
                      );
                    }
                  },
                  style: NeumorphicStyle(
                    depth: 10,
                    intensity: 0.86,
                    surfaceIntensity: 0.5,
                    shape: NeumorphicShape.flat,
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(50),),
                    color:Color(0xffe8e9ed),

                    /* shadowLightColor: Colors.white*/
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  child: Icon(Icons.arrow_forward_ios)),

             /* InkWell(
                onTap: (){
                  if(widget.navigate_page=="DiscoverMinimals"){
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DiscoverMinimals(),
                      ),
                    );
                  }else{
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const DiscoverCollection(),
                      ),
                    );
                  }

                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.3,
                          blurRadius: 2,
                          offset: Offset(-4,-4)
                      ),
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.3,
                          blurRadius: 2,
                          offset: Offset(4,4)
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
  Widget singleProductWidget(String productImg)
  {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height:MediaQuery.of(context).size.height*0.135,
          width:MediaQuery.of(context).size.height*0.135,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(productImg,
              fit: BoxFit.cover,),
          ),
        ),
        Positioned(
          bottom:0,
          right:0,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
            child: Center(
              child: Image.asset("asset/images/icons/add-to-basket.png",
                  color: Colors.white,
                  height:20
              ),
            ),
          ),
        )
      ],
    );
  }
  int selected=31;
}
