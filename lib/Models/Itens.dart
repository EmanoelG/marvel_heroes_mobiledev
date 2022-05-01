import 'dart:convert';

class Items {
  String resourceURI;
  String name;

  Items({
    required this.resourceURI,
    required this.name,
  });

  Items copyWith({
    String? resourceURI,
    String? name,
  }) {
    return Items(
      resourceURI: resourceURI ?? this.resourceURI,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      resourceURI: map['resourceURI'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() => 'Itens(resourceURI: $resourceURI, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Items &&
        other.resourceURI == resourceURI &&
        other.name == name;
  }

  @override
  int get hashCode => resourceURI.hashCode ^ name.hashCode;
}
