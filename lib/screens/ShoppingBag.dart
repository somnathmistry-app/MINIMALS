import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:minimals/controllers/my_cart_controller.dart';
import 'package:minimals/screens/CheckOutPage.dart';

import 'HomeScreen.dart';

class ShoppingBag extends StatefulWidget {


  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_cart_list();
  }
  get_cart_list()async{
    var response=await MyCartController().getCartList();
    print(response);
  }
  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text("Shopping Bag", style: TextStyle(
            fontFamily: "popins-b",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                 productWidget("asset/images/Grey TShirt.jpeg", "MAUVE T-SHIRT", "M", "BLACK", "1", "₹2,999"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Divider(),
                  ),
                  productWidget("asset/images/Sweatshirt Grey.jpeg", "SAUVE T-SHIRT", "M", "BLACK", "1", "₹2,959"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Divider(),
                  ),
                  productWidget("asset/images/White Tshirt.jpeg", "SAUVE T-SHIRT", "M", "BLACK", "1", "₹2,959"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Divider(),
                  ),
                  productWidget("asset/images/purse.png", "SAUVE T-SHIRT", "", "BLACK", "1", "₹2,959"),
                  SizedBox(height: 200,)
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              child: SizedBox(
               // height: 400,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(

                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration( //color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18))),

                      padding: EdgeInsets.symmetric(horizontal: 15),
                      //color: Colors.red.withOpacity(0.5),



                      child:   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order Value", style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "gotham",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                              ),),
                              Text("₹2,500.00", style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "gotham",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                              ),)
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping", style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "gotham",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                              ),),
                              Text("COMPLIMENTARY", style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "gotham",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                              ),)
                            ],
                          ),

                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discounts", style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "gotham",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400

                              ),),
                              Text("APPLY PROMO CODE", style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "gotham",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400

                              ),),
                            ],
                          ),
                          SizedBox(height:5),
                          Divider(thickness: 1,),

                          SizedBox(height:0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("TOTAL", style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "gotham",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900
                              ),),
                              Text("₹10,556.00", style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "gotham",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900
                              ),)
                            ],
                          ),
                          SizedBox(height:15),

                          Center(
                            child: NeumorphicButton(


                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPage()));

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
                                  Text("CHECKOUT", style: TextStyle(
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
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );

  }
  Widget productWidget(String imageUrl, String productName, String size, String colorName, String quantity, String price)
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height:145,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imageUrl),fit: BoxFit.cover
              ),
               /* boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(0,2),
                    blurRadius: 3,
                    spreadRadius: .5
                )]*/
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productName, style: TextStyle(
                                  fontFamily: "popins-r",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  height: 0.7
                              ),

                              ),
                              SizedBox(height: 8,),
                              Text('Hoodie', style: TextStyle(
                                fontFamily: "popins-r",
                                fontSize: 11,
                                height: 0.8,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey,

                              ),),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                            decoration: BoxDecoration(
                              color: Color(0xffF4F4F4),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              /* boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(0,2),
                                blurRadius: 3,
                                spreadRadius: .5
                            )]*/
                            ),
                            child: Row(
                              children: [
                                /*Icon(Icons.add,size: 18,),*/
                                /*Text('-', style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: "gotham"
                                ,fontWeight: FontWeight.w900
                            ),),*/
                                //Icon(Icons.remove,size: 18,),
                                Image.asset('asset/images/minus-sign.png',width: 10,),
                                SizedBox(width:10),
                                Text(quantity, style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "gotham"
                                ),),
                                SizedBox(width:10),
                                Image.asset('asset/images/plus.png',height: 10,width: 10,),

                                /* Icon(Icons.remove,size: 18,)*/
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4,),
                      Text(price, style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.black
                      ),),
                      /*Text("QUANTITY $quantity", style:TextStyle(
                          fontFamily: "gotham",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      )),*/
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(),
                          Text("PRODUCT ID : 12345", style:TextStyle(
                              fontFamily: "popins-r",
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey
                          )),
                          if(colorName!="") Text("COLOR : $colorName", style:TextStyle(
                              fontFamily: "popins-r",
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey
                          )),
                          if(size != "") Text("SIZE : $size", style:TextStyle(
                              fontFamily: "popins-r",
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey
                          )),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF4F4F4),
                         // borderRadius: BorderRadius.all(Radius.circular(30)),
                          /* boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(0,2),
                                blurRadius: 3,
                                spreadRadius: .5
                            )]*/
                        ),
                        child: Icon(Icons.delete_outlined,size: 18,)
                      )


                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
