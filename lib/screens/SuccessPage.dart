import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/screens/PaymentPage.dart';


import 'HomeScreen.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,

        // leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
        //   Navigator.pop(context);
        // },),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text("Checkout", style: TextStyle(
            fontFamily: "popins-s",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),

      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50,bottom: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.place_rounded,color: Colors.black,),

                  Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),),
                  Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),),
                  Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),),
                  Icon(Icons.credit_card_rounded,color: Colors.black,),

                  Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),),
                  Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),),
                  Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),),
                  Icon(Icons.check_circle_rounded,color: Colors.black,),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 150,width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.1)
                  ),
                  child: Center(child: Image.asset('asset/images/shipping.png',height: 80,),),
                ),

                SizedBox(height: 20,),
                Text("Congrats!", style: TextStyle(
                    fontFamily: "popins-s",
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                ),),
                SizedBox(height: 20,),
                Column(


                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Thank you for shopping ", style: TextStyle(
                            fontFamily: "popins-r",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey
                        ),
                        textAlign: TextAlign.center,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Text("MINIMALS.", style: TextStyle(
                              fontFamily: "adam",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),
                            textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                    Text("Your orders will be delivered soon.", style: TextStyle(
                        fontFamily: "popins-r",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),
                      textAlign: TextAlign.center,),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:28.0),
              child: Center(
                child: NeumorphicButton(


                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/mainContainer");
                  },
                  style: NeumorphicStyle(
                    depth: 10,
                    intensity: 0.86,
                    surfaceIntensity: 0.5,
                    shape: NeumorphicShape.flat,
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(40),),
                    color: Colors.black,

                    /* shadowLightColor: Colors.white*/
                  ),
                  //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  child:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Continue Shopping", style: TextStyle(
                          color: Colors.white,
                          fontFamily: "gotham",
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
 
}
