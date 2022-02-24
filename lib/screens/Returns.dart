import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:minimals/screens/returns_detail.dart';
class Returns extends StatefulWidget {
  const Returns({Key? key}) : super(key: key);

  @override
  _ReturnsState createState() => _ReturnsState();
}

class _ReturnsState extends State<Returns> {
  List<String> imageUrl = [
    "asset/images/blacktShirt.png",
    "asset/images/sauvetShirt.png",
    "asset/images/wallet.png",
    "asset/images/purse.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("MY RETURNS", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: (){
                 // Navigator.pushReplacementNamed(context, '/orderDetails');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReturnDetails()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  elevation: 4,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 18,right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Date', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),),
                                SizedBox(height: 0,),
                                Text('Jan 9,2022', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Value', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),),
                                SizedBox(height: 0,),
                                Text('₹ 2,999.00', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Return ID', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),),
                                SizedBox(height: 0,),
                                Text('12358944', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('asset/images/Grey TShirt.jpeg'),fit: BoxFit.cover
                                ),

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
                                                SizedBox(height: 8,),
                                                Text('MAUVE T-SHIRT', style: TextStyle(
                                                    fontFamily: "popins-r",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black,
                                                    height: 0.7
                                                ),

                                                ),
                                                SizedBox(height: 4,),
                                                Text('Hoodie', style: TextStyle(
                                                  fontFamily: "popins-r",
                                                  fontSize: 11,
                                                  height: 0.8,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.grey,

                                                ),),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('₹ 2,999.00', style: TextStyle(
                                                    fontFamily: "gotham",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black
                                                ),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(),
                                        Text("PRODUCT ID : 12345", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("QUANTITY : 3", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("COLOR : GREY", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("SIZE : L", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(width: 5,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Order ID', style: TextStyle(
                                                fontFamily: "gotham",
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black
                                            ),),
                                            SizedBox(height: 0,),
                                            Text('12358944', style: TextStyle(
                                                fontFamily: "gotham",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black
                                            ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: InkWell(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ReturnDetails()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  elevation: 4,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 18,right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Date', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),),
                                SizedBox(height: 0,),
                                Text('Jan 9,2022', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Value', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),),
                                SizedBox(height: 0,),
                                Text('₹ 2,999.00', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order ID', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),),
                                SizedBox(height: 0,),
                                Text('12358944', style: TextStyle(
                                    fontFamily: "gotham",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('asset/images/Grey TShirt.jpeg'),fit: BoxFit.cover
                                ),

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
                                                SizedBox(height: 8,),
                                                Text('MAUVE T-SHIRT', style: TextStyle(
                                                    fontFamily: "popins-r",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black,
                                                    height: 0.7
                                                ),

                                                ),
                                                SizedBox(height: 4,),
                                                Text('Hoodie', style: TextStyle(
                                                  fontFamily: "popins-r",
                                                  fontSize: 11,
                                                  height: 0.8,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.grey,

                                                ),),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('₹ 2,999.00', style: TextStyle(
                                                    fontFamily: "gotham",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black
                                                ),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(),
                                        Text("PRODUCT ID : 12345", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("QUANTITY : 3", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("COLOR : GREY", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("SIZE : L", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(width: 5,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Order ID', style: TextStyle(
                                                fontFamily: "gotham",
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black
                                            ),),
                                            SizedBox(height: 0,),
                                            Text('12358944', style: TextStyle(
                                                fontFamily: "gotham",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black
                                            ),),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Divider(),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('asset/images/Grey TShirt.jpeg'),fit: BoxFit.cover
                                ),

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
                                                SizedBox(height: 8,),
                                                Text('MAUVE T-SHIRT', style: TextStyle(
                                                    fontFamily: "popins-r",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black,
                                                    height: 0.7
                                                ),

                                                ),
                                                SizedBox(height: 4,),
                                                Text('Hoodie', style: TextStyle(
                                                  fontFamily: "popins-r",
                                                  fontSize: 11,
                                                  height: 0.8,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.grey,

                                                ),),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('₹ 2,999.00', style: TextStyle(
                                                    fontFamily: "gotham",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black
                                                ),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(),
                                        Text("PRODUCT ID : 12345", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("QUANTITY : 3", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("COLOR : GREY", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                        Text("SIZE : L", style:TextStyle(
                                            fontFamily: "popins-r",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(width: 5,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Order ID', style: TextStyle(
                                                fontFamily: "gotham",
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black
                                            ),),
                                            SizedBox(height: 0,),
                                            Text('12358944', style: TextStyle(
                                                fontFamily: "gotham",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black
                                            ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

}
