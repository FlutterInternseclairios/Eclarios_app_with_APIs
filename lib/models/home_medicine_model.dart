class HomeMedicineModel {
  int? status;
  String? message;
  List<Data>? data;

  HomeMedicineModel({this.status, this.message, this.data});

  HomeMedicineModel.fromJson(Map<dynamic, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? name;
  String? subname;
  String? description;
  String? price;
  String? image;

  Data(
      {this.id,
      this.name,
      this.subname,
      this.description,
      this.price,
      this.image});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    name = json["name"];
    subname = json["subname"];
    description = json["description"];
    price = json["price"];
    image = json["image"];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["subname"] = subname;
    _data["description"] = description;
    _data["price"] = price;
    _data["image"] = image;
    return _data;
  }
}
