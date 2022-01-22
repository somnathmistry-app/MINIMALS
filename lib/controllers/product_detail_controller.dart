import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:minimals/models/product_detail_model.dart';
import 'package:minimals/models/products_model.dart';


class ProductDetailController {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<ProductDetailModel> getProductDetail(var product_id) async {
    late ProductDetailModel productDetailModel;

    try {

      var response = await http.post(Uri.parse("${BaseUrl.baseUrl}/product_detail"),
        body: {
        "product_id":"$product_id"
        }
      );
      print(response.body.toString());
    //  if (response.body.isNotEmpty) {

        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        productDetailModel = ProductDetailModel.fromJson(jsonMap);

        return productDetailModel;
     /* }else{

        return productDetailModel;
      }*/
    } catch (e) {

      return productDetailModel;
    }

  }


}