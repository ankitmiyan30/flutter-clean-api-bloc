// import 'dart:async';
// import 'package:clean_demo/config/app_urls.dart';
// import 'package:http/http.dart' as http;

// class ProductNetworkService {
//   var client = http.Client();

//   Future<Map<String, String>> defaultHeader() async {
//     var headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };
//     return headers;
//   }

//   Future<http.Response> getRequest(dynamic param, String endpoint) async {
//     var header = await defaultHeader();
//     try {
//       var response = await client.get(
//         Uri.parse('${AppUrls.baseUrl}$endpoint'),
//         headers: header,
//       );
//       return response;
//     } catch (e) {
//       return http.Response(e.toString(), 500);
//     }
//   }
// }

import 'dart:convert';
import 'package:clean_demo/config/app_urls.dart';
import 'package:clean_demo/features/dashboard/data/model/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductDataSource {
  Future<ProductResponseModel> getProducts();
}

class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;
  ProductDataSourceImpl(this.client);

  @override
  Future<ProductResponseModel> getProducts() async {
    final response = await client.get(
      Uri.parse('${AppUrls.baseUrl}${AppUrls.productEndPoint}'),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var jsonData = ProductResponseModel.fromJson(json);
      return jsonData;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
