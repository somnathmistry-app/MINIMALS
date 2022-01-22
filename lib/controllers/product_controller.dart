import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:minimals/api_constants/base_url.dart';
import 'package:minimals/models/products_model.dart';


class ProductController {
  var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InRlc3Rlcl9taW5pbWFsc0BnbWFpbC5jb20iLCJpZCI6IjMiLCJpYXQiOjE2NDE4MDA2OTgsIm5iZiI6MTY0MTgwMDY5OH0.vpl7LKadF_puaQU8GodfTdPV7a4WnHLoHc7wvefOTSI";

  Future<List<Product>> getProductList(var brand,var category,var gender,var color,var size,var prize) async {
    print(prize);

    ProductsModel productsModel;


    try {
      var url = Uri.parse("${BaseUrl.baseUrl}/products");


      final request = http.MultipartRequest(
        "POST",
        url,
      );
      request.fields['brand_id'] = brand;

      if(category!="null"){
        request.fields['cat_id'] = '$category';
      }

      if(gender!="null"){
        request.fields['gender'] = '$gender';
      }
      if(color!="null"){
        request.fields['color'] = '$color';
      }

      if(size!="null"){

        request.fields['size'] = '$size';
      }

      if(prize!="null"){

        request.fields['price'] = '$prize';
      }




      var response = await request.send();

      final respStr = await response.stream.bytesToString();
      print(response.statusCode);
      print(respStr);

      if(respStr.isNotEmpty){
            var jsonString = '{"products":${respStr.toString()}}';
            var jsonMap = json.decode(jsonString);
         productsModel = ProductsModel.fromJson(jsonMap);

         return productsModel.products;
      }else{
        print('fail');

            return [];
      }



    } catch (e) {

      return [];
    }

  }


}