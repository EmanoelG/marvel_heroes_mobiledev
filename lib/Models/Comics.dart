import 'dart:convert';

import 'package:marvel_heroes_yt/Models/Itens.dart';

import 'Itens.dart';

class Comics {
  late int available;
  late String collectionURI;
  late List<Items> Ites;
  late int returned;
  fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      List<Items> Ites = [];
      json['items'].forEach((v) {
        Ites.add(new Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.Ites != null) {
      data['items'] = this.Ites.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}
