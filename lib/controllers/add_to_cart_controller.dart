import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:minimals/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddToCartController {
 // var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<String> addToCart(var product_id,var sizes) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token= prefs.getString('token');
    print(token);


    try {

      var response = await http.post(Uri.parse("${BaseUrl.baseUrl}/addtocart"),
          body: {
            //"Header" : 'Authorization:{$token}',
            "product_id" : product_id,
            "quantity" : '1',
            "size_id" : '$sizes',
            "action" : 'add',
            "device_id" : '1234'
          },
      headers: {
        'Authorization':'$token'
      });
      print(response.body.toString());
      if (response.body.contains('true')) {
        print('hhhhhhhhhhhhhhheeeeeeeeeeeeeeeeee');

        return "success";
      }else{

        var convert = json.decode(response.body);

        return "${convert["message"].toString()}";
      }
    } catch (e) {

      return "$e";
    }

  }
  setAsLoggedIn(bool status) async {
    print("JJJJJJJJJJJJ $status" );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', status);
  }

}