class AutoGenerate {
  AutoGenerate({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;
  late final int status;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
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
    this.featured,
    required this.image,
  });
  late final int id;
  late final String productName;
  late final String productNameFr;
  late final String categoryId;
  late final String subcategoryId;
  late final String productPrice;
  late final String availableQuantity;
  late final String productWeight;
  late final String? featured;
  late final String image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productNameFr = json['product_name_fr'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productPrice = json['product_price'];
    availableQuantity = json['available_quantity'];
    productWeight = json['product_weight'];
    featured = null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_name'] = productName;
    _data['product_name_fr'] = productNameFr;
    _data['category_id'] = categoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['product_price'] = productPrice;
    _data['available_quantity'] = availableQuantity;
    _data['product_weight'] = productWeight;
    _data['featured'] = featured;
    _data['image'] = image;
    return _data;
  }
}
