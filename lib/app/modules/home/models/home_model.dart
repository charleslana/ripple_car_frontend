import 'dart:convert';

class HomeModel {
  HomeModel({
    required this.id,
    required this.email,
    required this.name,
  });

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  final int id;
  final String email;
  final String name;

  HomeModel copyWith({
    int? id,
    String? email,
    String? name,
  }) {
    return HomeModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
