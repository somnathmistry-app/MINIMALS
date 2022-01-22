import 'package:flutter/material.dart';
class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
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
        title: Text("Orders", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [

            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, '/orderDetails');
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(4, (index){
                        return Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(0,2),
                                  blurRadius: 5,
                                  spreadRadius: .5
                              )]
                          ),
                          height:10,
                          width: 10,
                            child: Image.asset(imageUrl[index]),
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ORDER ID", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "gotham",
                                color: Colors.grey,
                                fontWeight: FontWeight.w700
                            ),),
                            Text("56090001", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "gotham",
                                color: Colors.black,
                                fontWeight: FontWeight.w900
                            ),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ORDER DATE", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "gotham",
                                color: Colors.grey,
                                fontWeight: FontWeight.w700
                            ),),
                            Text("01-12-2021", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "gotham",
                                color: Colors.black,
                                fontWeight: FontWeight.w900
                            ),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ORDER VALUE", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "gotham",
                                color: Colors.grey,
                                fontWeight: FontWeight.w700
                            ),),
                            Text("₹10,556", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "gotham",
                                color: Colors.black,
                                fontWeight: FontWeight.w900
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
