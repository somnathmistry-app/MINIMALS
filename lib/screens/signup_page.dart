import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/screens/PaymentPage.dart';
import 'package:minimals/screens/SuccessPage.dart';
import 'package:minimals/screens/otp_verification.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'HomeScreen.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
                            Text('Create\nyour account',style:
                            TextStyle(fontWeight: FontWeight.w900,fontSize: 28,fontFamily: 'popins-r',color: Colors.black,height: 0.9),),
                            SizedBox(height: 60,),
                            Container(
                              width: screenWidth-36,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('First Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                                      SizedBox(height: 10,),
                                      Container(
                                          height: 30,

                                          width: (screenWidth-44)/2,
                                          child: TextField(decoration: InputDecoration(

                                            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                          ),
                                            style: TextStyle(fontFamily: 'popins-s'),)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Last Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                                      SizedBox(height: 10,),
                                      Container(
                                          height: 30,

                                          width: (screenWidth-44)/2,
                                          child: TextField( style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                          ),)),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: 24,),
                            Text('Email',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),
                            SizedBox(height: 24,),
                            Text('Phone',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField(
                                    keyboardType: TextInputType.phone,
                                  style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),
                            SizedBox(height: 24,),



                            Text('Password',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                            SizedBox(height: 10,),
                            Container(
                                height: 30,

                                width: screenWidth-36,
                                child: TextField(
                                    obscureText: true,
                                  maxLength: 10,style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(

                                  counterText: "",
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                ),)),
                            SizedBox(height: 40,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Text('by signing up you agree to the\nterms and conditions and privacy policy',
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',
                                        color: Colors.grey,height: 0.9),),
                                ),

                              ],
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
                  SizedBox(height:50),

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
                          Text("Sign Up", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "gotham",
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),),
                  ),
                  SizedBox(height:30),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',
                              color: Colors.black,height: 0.9),),
                        InkWell(
                          hoverColor: Colors.transparent,
                          highlightColor:Colors.transparent,
                          focusColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                          child: Text('Log in',
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
