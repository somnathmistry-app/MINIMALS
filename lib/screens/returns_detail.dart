import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' as gb;

import 'package:timeline_tile/timeline_tile.dart';
class ReturnDetails extends StatefulWidget {
  const ReturnDetails({Key? key}) : super(key: key);

  @override
  _ReturnDetailsState createState() => _ReturnDetailsState();
}

class _ReturnDetailsState extends State<ReturnDetails> {
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
        title: Text("RETURN STATUS", style: TextStyle(
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
              child: Column(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),topLeft: Radius.circular(12)
                      )),
                      elevation: 4,
                      child:Column(
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
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shipping By', style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                      ),),
                      SizedBox(width: 10,),
                      Text('BLUEDART', style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  SizedBox(height: 0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Traccking ID', style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                      ),),
                      SizedBox(width: 10,),
                      Text('254896423', style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  Divider(),
                  ListView(

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      TimelineTile(
                        alignment: TimelineAlign.start,
                        lineXY: 0.1,
                        isFirst: true,
                        indicatorStyle: const IndicatorStyle(
                          width: 15,
                          color: Colors.blue,
                          padding: EdgeInsets.all(4),
                        ),

                        endChild:  _RightChild(

                          title: 'Return Initiated',
                          message: 'We have initiated your return request.',
                        ),
                        beforeLineStyle: const LineStyle(
                          thickness: 4,
                          color:Colors.blue,
                        ),
                      ),
                      TimelineTile(
                        alignment: TimelineAlign.start,
                        lineXY: 0.1,
                        indicatorStyle: const IndicatorStyle(
                          width: 15,
                          color: Colors.blue,
                          padding: EdgeInsets.all(4),
                        ),
                        endChild: const _RightChild(

                          title: 'Evaluation',
                          message: 'Your return parcel has been recieved by us.',
                        ),
                        beforeLineStyle: const LineStyle(
                          color: Colors.blue,
                        ),
                      ),

                      TimelineTile(
                        alignment: TimelineAlign.start,
                        lineXY: 0.1,
                        isLast: true,
                        indicatorStyle: const IndicatorStyle(
                          width: 15,
                          color: Colors.blue,
                          padding: EdgeInsets.all(4),
                        ),
                        endChild:  _RightChild(
                          disabled: false,

                          title: 'Return Accepted',
                          message: 'Your return request has been accepted.',
                        ),
                        beforeLineStyle: const LineStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(height: 80,),
            Text('Do you need any help?', style: TextStyle(
                fontFamily: "gotham",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey
            ),),
            Text('Contact support', style: TextStyle(
                fontFamily: "gotham",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey
            ),),

            SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }

}
class _RightChild extends StatelessWidget {
  const _RightChild({


    required this.title,
    required this.message,
    this.disabled = false,
  }) ;


  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10,top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontFamily: "gotham",
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : Colors.black,
                  fontFamily: "gotham",
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Jan 9,2022', style: TextStyle(
                  fontFamily: "gotham",
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.black
              ),),
              SizedBox(height: 0,),
              Text('11:50 AM', style: TextStyle(
                  fontFamily: "gotham",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey
              ),),
            ],
          ),

        ],
      ),
    );
  }
}