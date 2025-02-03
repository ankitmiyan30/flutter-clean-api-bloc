import 'package:equatable/equatable.dart';

class ProductResponseEntities extends Equatable {
  final List<ProductList>? products;
  final int? total;
  final int? skip;
  final int? limit;

  const ProductResponseEntities({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  @override
  List<Object?> get props => [products, total, skip, limit];

  // factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
  //       products: json["products"] == null
  //           ? []
  //           : List<Product>.from(
  //               json["products"]!.map((x) => Product.fromJson(x))),
  //       total: json["total"],
  //       skip: json["skip"],
  //       limit: json["limit"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "products": products == null
  //           ? []
  //           : List<dynamic>.from(products!.map((x) => x.toJson())),
  //       "total": total,
  //       "skip": skip,
  //       "limit": limit,
  //     };
}

class ProductList extends Equatable {
  final bool? isAddedToCart;
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  const ProductList({
    this.isAddedToCart,
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [
        isAddedToCart,
        id,
        title,
        description,
        category,
        price,
        discountPercentage,
        rating,
        stock,
        tags,
        brand,
        sku,
        weight,
        dimensions,
        warrantyInformation,
        shippingInformation,
        availabilityStatus,
        reviews,
        returnPolicy,
        minimumOrderQuantity,
        meta,
        images,
        thumbnail,
      ];

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        isAddedToCart: false,
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"]!,
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        returnPolicy: json["returnPolicy"]!,
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "title": title,
  //       "description": description,
  //       "category": category,
  //       "price": price,
  //       "discountPercentage": discountPercentage,
  //       "rating": rating,
  //       "stock": stock,
  //       "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
  //       "brand": brand,
  //       "sku": sku,
  //       "weight": weight,
  //       "dimensions": dimensions?.toJson(),
  //       "warrantyInformation": warrantyInformation,
  //       "shippingInformation": shippingInformation,
  //       "availabilityStatus": availabilityStatus,
  //       "reviews": reviews == null
  //           ? []
  //           : List<dynamic>.from(reviews!.map((x) => x.toJson())),
  //       "returnPolicy": returnPolicy,
  //       "minimumOrderQuantity": minimumOrderQuantity,
  //       "meta": meta?.toJson(),
  //       "images":
  //           images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  //       "thumbnail": thumbnail,
  //     };
}

class Dimensions extends Equatable {
  final double? width;
  final double? height;
  final double? depth;

  const Dimensions({
    this.width,
    this.height,
    this.depth,
  });
  @override
  List<Object?> get props => [width, height, depth];

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
      );

  // Map<String, dynamic> toJson() => {
  //       "width": width,
  //       "height": height,
  //       "depth": depth,
  //     };
}

class Meta extends Equatable {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  const Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });
  @override
  List<Object?> get props => [createdAt, updatedAt, barcode, qrCode];
  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  // Map<String, dynamic> toJson() => {
  //       "createdAt": createdAt?.toIso8601String(),
  //       "updatedAt": updatedAt?.toIso8601String(),
  //       "barcode": barcode,
  //       "qrCode": qrCode,
  //     };
}

class Review extends Equatable {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  const Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  @override
  List<Object?> get props =>
      [rating, comment, date, reviewerName, reviewerEmail];

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  // Map<String, dynamic> toJson() => {
  //       "rating": rating,
  //       "comment": comment,
  //       "date": date?.toIso8601String(),
  //       "reviewerName": reviewerName,
  //       "reviewerEmail": reviewerEmail,
  //     };
}
