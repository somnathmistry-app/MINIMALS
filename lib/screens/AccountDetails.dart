import 'package:flutter/material.dart';
class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Account Details", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0,2),
                      blurRadius: 5,
                      spreadRadius: .5
                  )]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NAME", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("ALEX BENJAMIN", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  SizedBox(height:10),
                  Text("EMAIL", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("alexbenjamin@gmail.com", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  SizedBox(height:10),
                  Text("PHONE NUMBER", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "gotham",
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("+919854521356", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text("UPDATE", style: TextStyle(
                          fontSize: 14,
                          fontFamily: "gotham",
                          color: Colors.grey,
                          fontWeight: FontWeight.w700
                      ),),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.settings, size: 20,),
                  onPressed: (){},
                ),
                Text("RESET PASSWORD", style: TextStyle(
                    fontSize: 14,
                    fontFamily: "gotham",
                    color: Colors.grey,
                    fontWeight: FontWeight.w700
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
