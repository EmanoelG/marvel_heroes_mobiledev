import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../Home/Personagem/Personagem.dart';
import 'Comics.dart';
import 'Itens.dart';
import 'Thumbnail.dart';

class ComicsNew {
  late int id;
  late int digitalId;
  late String title;
  late int issueNumber;
  late String variantDescription;
  late String description;
  late String modified;
  late String isbn;
  late String upc;
  late String diamondCode;
  late String ean;
  late String issn;
  late String format;
  late int pageCount;
  late List<String> textObjects;
  late String resourceURI;
  late List<String> urls;
  late Series series;
  late List<Null> variants;
  late List<Null> collections;
  late List<Null> collectedIssues;
  late List<String> dates;
  late List<String> prices;
  late Thumbnail thumbnail;
  late List<Null> images;
  late Creators creators;
  late Map<String, dynamic> characters;
  late Stories stories;
  late Events events;
  ComicsNew({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceURI,
    required this.urls,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'digitalId': digitalId,
      'title': title,
      'issueNumber': issueNumber,
      'variantDescription': variantDescription,
      'description': description,
      'modified': modified,
      'isbn': isbn,
      'upc': upc,
      'diamondCode': diamondCode,
      'ean': ean,
      'issn': issn,
      'format': format,
      'pageCount': pageCount,
      'textObjects': textObjects,
      'resourceURI': resourceURI,
      'urls': urls,
      'dates': dates,
      'prices': prices,
    };
  }

  factory ComicsNew.fromMap(Map<String, dynamic> map) {
    return ComicsNew(
      id: map['id'],
      digitalId: map['digitalId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      issueNumber: map['issueNumber']?.toInt() ?? 0,
      variantDescription: map['variantDescription'] ?? '',
      description: map['description'] ?? '',
      modified: map['modified'] ?? '',
      isbn: map['isbn'] ?? '',
      upc: map['upc'] ?? '',
      diamondCode: map['diamondCode'] ?? '',
      ean: map['ean'] ?? '',
      issn: map['issn'] ?? '',
      format: map['format'] ?? '',
      pageCount: map['pageCount']?.toInt() ?? 0,
      textObjects: List<String>.from(map['textObjects']),
      resourceURI: map['resourceURI'] ?? '',
      urls: List<String>.from(map['urls']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicsNew.fromJson(String source) =>
      ComicsNew.fromMap(json.decode(source));

  ComicsNew copyWith({
    int? id,
    int? digitalId,
    String? title,
    int? issueNumber,
    String? variantDescription,
    String? description,
    String? modified,
    String? isbn,
    String? upc,
    String? diamondCode,
    String? ean,
    String? issn,
    String? format,
    int? pageCount,
    List<String>? textObjects,
    String? resourceURI,
    List<String>? urls,
    Series? series,
    List<Null>? variants,
    List<Null>? collections,
    List<Null>? collectedIssues,
    List<String>? dates,
    List<String>? prices,
    Thumbnail? thumbnail,
    List<Null>? images,
    Creators? creators,
    Map<String, dynamic>? characters,
    Stories? stories,
    Events? events,
  }) {
    return ComicsNew(
      id: id ?? this.id,
      digitalId: digitalId ?? this.digitalId,
      title: title ?? this.title,
      issueNumber: issueNumber ?? this.issueNumber,
      variantDescription: variantDescription ?? this.variantDescription,
      description: description ?? this.description,
      modified: modified ?? this.modified,
      isbn: isbn ?? this.isbn,
      upc: upc ?? this.upc,
      diamondCode: diamondCode ?? this.diamondCode,
      ean: ean ?? this.ean,
      issn: issn ?? this.issn,
      format: format ?? this.format,
      pageCount: pageCount ?? this.pageCount,
      textObjects: textObjects ?? this.textObjects,
      resourceURI: resourceURI ?? this.resourceURI,
      urls: urls ?? this.urls,
    );
  }

  @override
  String toString() {
    return 'ComicsNew(id: $id, digitalId: $digitalId, title: $title, issueNumber: $issueNumber, variantDescription: $variantDescription, description: $description, modified: $modified, isbn: $isbn, upc: $upc, diamondCode: $diamondCode, ean: $ean, issn: $issn, format: $format, pageCount: $pageCount, textObjects: $textObjects, resourceURI: $resourceURI, urls: $urls, series: $series, variants: $variants, collections: $collections, collectedIssues: $collectedIssues, dates: $dates, prices: $prices, thumbnail: $thumbnail, images: $images, creators: $creators, characters: $characters, stories: $stories, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComicsNew &&
        other.id == id &&
        other.digitalId == digitalId &&
        other.title == title &&
        other.issueNumber == issueNumber &&
        other.variantDescription == variantDescription &&
        other.description == description &&
        other.modified == modified &&
        other.isbn == isbn &&
        other.upc == upc &&
        other.diamondCode == diamondCode &&
        other.ean == ean &&
        other.issn == issn &&
        other.format == format &&
        other.pageCount == pageCount &&
        listEquals(other.textObjects, textObjects) &&
        other.resourceURI == resourceURI &&
        listEquals(other.urls, urls) &&
        other.series == series &&
        listEquals(other.variants, variants) &&
        listEquals(other.collections, collections) &&
        listEquals(other.collectedIssues, collectedIssues) &&
        listEquals(other.dates, dates) &&
        listEquals(other.prices, prices) &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images) &&
        other.creators == creators &&
        mapEquals(other.characters, characters) &&
        other.stories == stories &&
        other.events == events;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        digitalId.hashCode ^
        title.hashCode ^
        issueNumber.hashCode ^
        variantDescription.hashCode ^
        description.hashCode ^
        modified.hashCode ^
        isbn.hashCode ^
        upc.hashCode ^
        diamondCode.hashCode ^
        ean.hashCode ^
        issn.hashCode ^
        format.hashCode ^
        pageCount.hashCode ^
        textObjects.hashCode ^
        resourceURI.hashCode ^
        urls.hashCode ^
        series.hashCode ^
        variants.hashCode ^
        collections.hashCode ^
        collectedIssues.hashCode ^
        dates.hashCode ^
        prices.hashCode ^
        thumbnail.hashCode ^
        images.hashCode ^
        creators.hashCode ^
        characters.hashCode ^
        stories.hashCode ^
        events.hashCode;
  }
}

class Creators {
  int available;
  String collectionURI;
  List<Items> items;
  int returned;

  Creators(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      List<Items> items = [];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

class Stories {
  int id;
  String title;
  String description;
  String resourceURI;
  String type;
  String modified;
  Thumbnail thumbnail;
  Creators creators;
  Personagem personagem;
  Series series;
  Comics comics;
  Events events;
  OriginalIssue originalIssue;

  Stories(
      {required this.id,
      required this.title,
      required this.description,
      required this.resourceURI,
      required this.type,
      required this.modified,
      required this.thumbnail,
      required this.creators,
      required this.personagem,
      required this.series,
      required this.comics,
      required this.events,
      required this.originalIssue});

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? thumbnail.fromJson(json['thumbnail'])
        : null;
    creators =
        json['creators'] != null ? creators.fromJson(json['creators']) : null;
    personagem = json['personagem'] != null
        ? personagem.fromJson(json['personagem'])
        : null;
    series = (json['series'] != null ? series.fromJson(json['series']) : null)!;
    comics = json['comics'] != null ? comics.fromJson(json['comics']) : null;
    events = json['events'] != null ? events.fromJson(json['events']) : null;
    originalIssue = json['originalIssue'] != null
        ? originalIssue.fromJson(json['originalIssue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    data['type'] = this.type;
    data['modified'] = this.modified;
    data['thumbnail'] = this.thumbnail;
    if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
    if (this.personagem != null) {
      data['personagem'] = this.personagem.toJson();
    }
    if (this.series != null) {
      data['series'] = this.series.toJson();
    }
    if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events.toJson();
    }
    if (this.originalIssue != null) {
      data['originalIssue'] = this.originalIssue.toJson();
    }
    return data;
  }
}

class Series {
  int available;
  String collectionURI;
  List<Items> items;

  Series(
      {required this.available,
      required this.collectionURI,
      required this.items});

  fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      List<Items> items = [];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int available;
  String collectionURI;
  List<Items> items;
  int returned;

  Events(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      List<Items> items = [];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

class OriginalIssue {
  String resourceURI;
  String name;

  OriginalIssue({required this.resourceURI, required this.name});

  fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}


