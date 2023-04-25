// To parse this JSON data, do
//
//     final singleProductView = singleProductViewFromJson(jsonString);

import 'dart:convert';

SingleProductView singleProductViewFromJson(String str) =>
    SingleProductView.fromJson(json.decode(str));

String singleProductViewToJson(SingleProductView data) =>
    json.encode(data.toJson());

class SingleProductView {
  SingleProductView({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  bool success;
  Data data;
  String message;
  int status;

  factory SingleProductView.fromJson(Map<String, dynamic> json) =>
      SingleProductView(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.productName,
    required this.productNameFr,
    required this.categoryId,
    required this.subcategoryId,
    required this.productPrice,
    required this.availableQuantity,
    required this.productWeight,
    required this.featured,
    required this.image,
  });

  int id;
  String productName;
  String productNameFr;
  String categoryId;
  String subcategoryId;
  String productPrice;
  String availableQuantity;
  String productWeight;
  String featured;
  String image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        productName: json["product_name"],
        productNameFr: json["product_name_fr"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        productPrice: json["product_price"],
        availableQuantity: json["available_quantity"],
        productWeight: json["product_weight"],
        featured: json["featured"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_name_fr": productNameFr,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "product_price": productPrice,
        "available_quantity": availableQuantity,
        "product_weight": productWeight,
        "featured": featured,
        "image": image,
      };
}
