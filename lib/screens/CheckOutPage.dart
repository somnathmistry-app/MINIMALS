import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minimals/screens/PaymentPage.dart';
import 'package:minimals/screens/SuccessPage.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'HomeScreen.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  static const platform = const MethodChannel("razorpay_flutter");

  //late Razorpay _razorpay;
  late double screenWidth;
  late double screenHeight;
  String _selectedcity="New York";
  String _selectedcountry="India";
  String _selectedpayment="Option 1";
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
        child: SingleChildScrollView(
          child: Column(
            children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50,right: 50,bottom: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.place_rounded,color: Colors.black,),

                            Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                          Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                          Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                          Icon(Icons.credit_card_rounded,color: Colors.grey,),

                          Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                          Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                          Container(height: 3,width: 3,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                          Icon(Icons.check_circle_rounded,color: Colors.grey,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:18.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            // SizedBox(height: 14,),
                              Text('Shipping',style:
                              TextStyle(fontWeight: FontWeight.w900,fontSize: 28,fontFamily: 'popins-s',color: Colors.black,height: 0.7),),
                              SizedBox(height: 30,),
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
                              Text('Address',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                              SizedBox(height: 10,),
                              Container(
                                  height: 30,

                                  width: screenWidth-36,
                                  child: TextField( style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                    disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  ),)),
                              SizedBox(height: 24,),
                              Text('City',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                              SizedBox(height: 10,),
                              Container(
                                  height: 30,

                                  width: screenWidth-36,
                                  child: TextField( style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                    disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  ),)),
                              SizedBox(height: 24,),

                              Container(
                                width: screenWidth-36,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('State',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                                        SizedBox(height: 10,),
                                        Container(
                                          width: (screenWidth-44)/2,
                                          child: DropdownButton<String>(
                                            // Not necessary for Option 1
                                            value: _selectedcity,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedcity = newValue!;
                                              });
                                            },
                                            isExpanded: true,
                                            iconSize: 24.0,

                                            icon: Icon(Icons.keyboard_arrow_down),
                                            items: <String>['New York', 'Washington', 'London', 'Sanfransisco'].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,

                                                child: Text(value, style: TextStyle(fontFamily: 'popins-s'),),
                                              );
                                            }).toList(),
                                           // onChanged: (_) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Pincode',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                                        SizedBox(height: 10,),
                                        Container(
                                            height: 30,

                                            width: (screenWidth-44)/2,
                                            child: TextField( style: TextStyle(fontFamily: 'popins-s'),maxLength: 6,
                                              keyboardType: TextInputType.number,

                                              decoration: InputDecoration(
                                                counterText: "",


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

                              Text('Country',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                              SizedBox(height: 10,),
                              Container(
                                width: (screenWidth-36),
                                child: DropdownButton<String>(
                                  // Not necessary for Option 1
                                  value: _selectedcountry,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedcountry = newValue!;
                                    });
                                  },
                                  isExpanded: true,
                                  iconSize: 24.0,

                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: <String>['India', 'America', 'Australia', 'Canada'].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,

                                      child: Text(value, style: TextStyle(fontFamily: 'popins-s'),),
                                    );
                                  }).toList(),
                                  // onChanged: (_) {},
                                ),
                              ),

                              SizedBox(height: 24,),

                              Text('Mobile Number',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
                              SizedBox(height: 10,),
                              Container(
                                  height: 30,

                                  width: screenWidth-36,
                                  child: TextField( maxLength: 10,keyboardType: TextInputType.number,style: TextStyle(fontFamily: 'popins-s'),decoration: InputDecoration(
                                    counterText: "",
                                    disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.25,color: Colors.grey)),
                                  ),)),
                              SizedBox(height: 20,),
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
                                  SizedBox(width: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Text('Save for faster checkout next time.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: 'popins-r',color: Colors.grey,height: 0.7),),
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
                  SizedBox(height:25),

                  Center(
                    child: NeumorphicButton(


                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage()));

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
                          Text("Continue to Payment", style: TextStyle(
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
  /*@override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 2000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, toastLength: Toast.LENGTH_SHORT);
  }*/
}
