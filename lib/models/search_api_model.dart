
class SearchApiModel {
  int? status;
  String? message;
  List<Data>? data;

  SearchApiModel({this.status, this.message, this.data});

  SearchApiModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
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
  String? stars;
  String? rating;
  String? price;
  String? image;

  Data({this.id, this.name, this.subname, this.description, this.stars, this.rating, this.price, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    subname = json["subname"];
    description = json["description"];
    stars = json["stars"];
    rating = json["rating"];
    price = json["price"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["subname"] = subname;
    _data["description"] = description;
    _data["stars"] = stars;
    _data["rating"] = rating;
    _data["price"] = price;
    _data["image"] = image;
    return _data;
  }
}