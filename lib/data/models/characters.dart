class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;
  String? created;
  String? url;
  List<String>? episode;
  OriginModel? origin;
  LocationModel? location;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
    url = json['url'];
    episode = json['episode'].cast<String>();
    origin = OriginModel.fromJson(json['origin']);
    location = LocationModel.fromJson(json['location']);

  }
}

class OriginModel {
  String? name;
  String? url;

  OriginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class LocationModel {
  String? name;
  String? url;

  LocationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}