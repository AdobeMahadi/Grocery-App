class Catagories {
  Catagories({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;
  late final int status;

  Catagories.fromJson(Map<String, dynamic> json) {
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
    required this.categoryName,
    required this.categoryDetails,
    required this.image,
  });
  late final int id;
  late final String categoryName;
  late final String categoryDetails;
  late final String image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryDetails = json['category_details'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = categoryName;
    _data['category_details'] = categoryDetails;
    _data['image'] = image;
    return _data;
  }
}
