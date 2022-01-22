import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),

        title: Text("Account", style: TextStyle(
            fontFamily: "gotham",
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/myOrder");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Orders", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  IconButton(icon: Icon(
                    Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/credits");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Credits", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  IconButton(icon: Icon(
                    Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/addresses");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Addresses", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  IconButton(icon: Icon(
                    Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/returns");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Returns", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  IconButton(icon: Icon(
                    Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/notifications");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  IconButton(icon: Icon(
                    Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/accountDetails");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Account Details", style: TextStyle(
                      fontFamily: "gotham",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  ),),
                  IconButton(icon: Icon(
                    Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Support", style: TextStyle(
                    fontFamily: "gotham",
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                ),),
                IconButton(icon: Icon(
                  Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                  Navigator.pop(context);
                },),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Terms and Policies", style: TextStyle(
                    fontFamily: "gotham",
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                ),),
                IconButton(icon: Icon(
                  Icons.arrow_forward_ios, color: Colors.black,size: 15,),onPressed: (){
                  Navigator.pop(context);
                },),
              ],
            ),
            Spacer(),
            Center(
              child: Text("LOGOUT", style: TextStyle(
                  fontFamily: "gotham",
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.black
              ),),
            ),
            SizedBox(height:40)
          ],
        ),
      ),
    );
  }
}
