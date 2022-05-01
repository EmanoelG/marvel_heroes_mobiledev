import 'dart:convert';

import '../../Models/Comics.dart';
import '../../Models/Thumbnail.dart';

class Personagem {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  late String resourceURI;
  Comics comic;
  bool clicked = false;
  Personagem({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceURI,
    required this.comic,
    required this.clicked,
  });
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comic = (json['comics'] != null ? comic.fromJson(json['comics']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['resourceURI'] = this.resourceURI;
    if (this.comic != null) {
      data['comics'] = this.comic.toJson();
    }
    return data;
  }
}
