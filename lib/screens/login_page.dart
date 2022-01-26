import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/screens/PaymentPage.dart';
import 'package:minimals/screens/SuccessPage.dart';
import 'package:minimals/screens/forgot_password.dart';
import 'package:minimals/screens/otp_verification.dart';
import 'package:minimals/screens/signup_page.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'HomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),


      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left:18.0,top: 50),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 14,),
                            Text('Log into\nyour account',style:
                            TextStyle(fontWeight: FontWeight.w900,fontSize: 28,fontFamily: 'popins-r',color: Colors.black,height: 0.9),),
                            SizedBox(height: 60,),

                            Text('Email',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                                fontFamily: 'popins-r',color: Colors.black,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField( keyboardType: TextInputType.emailAddress,style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),
                            SizedBox(height: 24,),





                            Text('Password',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                                fontFamily: 'popins-r',color: Colors.black,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField( obscureText: true,maxLength: 10,style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                  counterText: "",
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),
                            SizedBox(height: 40,),
                            Container(
                              width: screenWidth-50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        hoverColor: Colors.transparent,
                                        highlightColor:Colors.transparent,
                                        focusColor:Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: (){
                                          setState(() {
                                            is_checked=!is_checked;
                                          });
                                        },
                                        child: Container(
                                          height: 15,width: 15,
                                          decoration: BoxDecoration(
                                            //shape: BoxShape.circle,
                                            borderRadius: BorderRadius.all(Radius.circular(2)),
                                            color: is_checked?Colors.black:Colors.white,
                                            border: Border.all(color: Colors.black),

                                          ),
                                          child: Center(
                                            child: Icon(Icons.check,color: Colors.white,size: 10,),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 0),
                                        child: Text('Rememember me',
                                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'popins-r',
                                              color: Colors.black,height: 0.9),),
                                      ),

                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child:  InkWell(
                                      hoverColor: Colors.transparent,
                                      highlightColor:Colors.transparent,
                                      focusColor:Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: (){
                                        Navigator.pushReplacement<void, void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) => const ForgotPassword(),
                                          ),
                                        );

                                      },
                                      child: Text('Forgot password?',
                                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'popins-r',
                                            color: Colors.black,height: 0.9),),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height:100),

                  Center(
                    child: NeumorphicButton(


                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerification()));

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
                  SizedBox(height:60),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',
                              color: Colors.black,height: 0.9),),
                        InkWell(
                          hoverColor: Colors.transparent,
                          highlightColor:Colors.transparent,
                          focusColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          },
                          child: Text('Sign up',
                            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13,fontFamily: 'popins-r',
                                color: Colors.black,height: 0.9,decoration: TextDecoration.underline),),
                        )
                      ],
                    ),
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
