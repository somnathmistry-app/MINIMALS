import 'package:flutter/material.dart';
class Returns extends StatefulWidget {
  const Returns({Key? key}) : super(key: key);

  @override
  _ReturnsState createState() => _ReturnsState();
}

class _ReturnsState extends State<Returns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Returns", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            productWidget("asset/images/blacktShirt.png", "MAUVE T-SHIRT 705", "M", "BLACK", "1", "₹2,999"),

          ],
        ),
      ),
    );
  }
  Widget productWidget(String imageUrl, String productName, String size, String colorName, String quantity, String price)
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(imageUrl)
                ),
                boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(0,2),
                    blurRadius: 3,
                    spreadRadius: .5
                )]
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productName, style: TextStyle(
                              fontFamily: "gotham",
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.black
                          ),),
                          if(size != "" && colorName!="") Text(size+"   "+colorName, style:TextStyle(
                              fontFamily: "gotham",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey
                          )),
                          Text("QUANTITY $quantity", style:TextStyle(
                              fontFamily: "gotham",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey
                          )),
                        ],
                      ),
                      Text(price, style: TextStyle(
                          fontFamily: "gotham",
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  Text("56090001-001", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  SizedBox(height:5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ORDER DATE", style:TextStyle(
                              fontFamily: "gotham",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey
                          )),
                          Text("01-12-2021", style: TextStyle(
                              fontFamily: "gotham",
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.black
                          ),),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("STATUS", style:TextStyle(
                              fontFamily: "gotham",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey
                          )),
                          Text("Returned", style: TextStyle(
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
            ),
          )
        ],
      ),
    );
  }
}
