// To parse this JSON data, do
//
//     final catagoryView = catagoryViewFromJson(jsonString);

import 'dart:convert';

CatagoryView catagoryViewFromJson(String str) =>
    CatagoryView.fromJson(json.decode(str));

String catagoryViewToJson(CatagoryView data) => json.encode(data.toJson());

class CatagoryView {
  CatagoryView({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  bool success;
  List<Datum> data;
  String message;
  int status;

  factory CatagoryView.fromJson(Map<String, dynamic> json) => CatagoryView(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.productName,
    required this.productNameFr,
    required this.categoryId,
    required this.subcategoryId,
    required this.productPrice,
    required this.availableQuantity,
    required this.productWeight,
    this.featured,
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
  String? featured;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
