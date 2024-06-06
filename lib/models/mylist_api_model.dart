class MyListApiModel {
  int? status;
  String? message;
  List<Data>? data;

  MyListApiModel({this.status, this.message, this.data});

  MyListApiModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
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
  String? profession;
  String? gender;
  String? image;

  Data({this.id, this.name, this.profession, this.gender, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    profession = json["profession"];
    gender = json["gender"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["profession"] = profession;
    _data["gender"] = gender;
    _data["image"] = image;
    return _data;
  }
}
