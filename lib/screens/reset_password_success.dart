import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/screens/PaymentPage.dart';
import 'package:minimals/screens/SuccessPage.dart';
import 'package:minimals/screens/forgot_password.dart';
import 'package:minimals/screens/login_page.dart';
import 'package:minimals/screens/otp_verification.dart';
import 'package:minimals/screens/signup_page.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'HomeScreen.dart';

class ResetSuccess extends StatefulWidget {
  const ResetSuccess({Key? key}) : super(key: key);

  @override
  _ResetSuccessState createState() => _ResetSuccessState();
}

class _ResetSuccessState extends State<ResetSuccess> {

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


        // leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
        //   Navigator.pop(context);
        // },),
        /*leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),*/
        automaticallyImplyLeading: false,


      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                children: [


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 14,),
                      Text('Your Password\nhas been reset',style:
                      TextStyle(fontWeight: FontWeight.w900,fontSize: 28,fontFamily: 'popins-r',color: Colors.black,height: 0.9),),







                    ],
                  )
                ],
              ),
              Column(
                children: [


                  Center(
                    child: NeumorphicButton(


                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const LoginPage(),
                          ),
                        );

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
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                      child:  Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Log In", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "gotham",
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),),
                  ),

                  SizedBox(height:30)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool is_checked=true;

}
