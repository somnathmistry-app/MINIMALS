import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimals/screens/Randomiser.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'DiscoverCollection.dart';
import 'DiscoverMinimals.dart';
import '../Helpers/font_scheme.dart';
import 'RandomiserGender.dart';
class LetsShuffle extends StatefulWidget {


  @override
  _LetsShuffleState createState() => _LetsShuffleState();
}

class _LetsShuffleState extends State<LetsShuffle> {

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

            Navigator.pop(context);
          },
        ),

      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [


            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LETS SHUFFLE",
                      style:TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'adam',fontWeight: FontWeight.w900,letterSpacing: 0.2),
                      textAlign: TextAlign.center,),
                  ],
                )
            ),
            NeumorphicButton(


                margin: EdgeInsets.symmetric(vertical: 30),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>Randomiser()
                  ));
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
            /*InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(
                    builder: (_)=>Randomiser()
                ));
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
    );
  }

}
