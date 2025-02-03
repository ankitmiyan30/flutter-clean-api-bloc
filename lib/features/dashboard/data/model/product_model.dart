import 'package:clean_demo/features/dashboard/domain/entities/products_entities.dart';

class ProductResponseModel extends ProductResponseEntities {
  // const ProductResponseModel({
  //   final List<ProductList>? products,
  //   final int? total,
  //   final int? skip,
  //   final int? limit,
  // });

  @override
  final List<ProductList>? products;
  @override
  final int? total;
  @override
  final int? skip;
  @override
  final int? limit;

  const ProductResponseModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as List;
    List<ProductList> productsList =
        productsJson.map((i) => ProductList.fromJson(i)).toList();
    var obj = ProductResponseModel(
      products: productsList,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
    return obj;
  }

  // ProductResponseModel(
  //   products: json["products"] == null
  //       ? []
  //       : List<ProductList>.from(
  //           json["products"]!.map((x) => ProductList.fromJson(x))),
  //   total: json["total"],
  //   skip: json["skip"],
  //   limit: json["limit"],
  // );
}
