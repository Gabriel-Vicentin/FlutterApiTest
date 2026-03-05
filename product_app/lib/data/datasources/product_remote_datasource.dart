import 'dart:convert';
import 'package:product_app/data/models/product_model.dart';
import 'package:product_app/core/network/client_http.dart';


class ProductRemoteDatasource {
  final HttpClient client ;
  
  ProductRemoteDatasource (this.client ) ;

  Future < List < ProductModel > > getProducts () async {
    final response = await client.get (
      "https://fakestoreapi.com/products"
  );

  final List data = jsonDecode(response.body) as List;
    return data
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}