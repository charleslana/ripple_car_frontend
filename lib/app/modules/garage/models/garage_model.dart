import 'dart:convert';

class GarageModel {
  GarageModel({
    required this.id,
    required this.level,
    required this.experience,
    required this.broken,
    required this.busted,
    required this.car,
  });

  factory GarageModel.fromJson(String source) =>
      GarageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory GarageModel.fromMap(Map<String, dynamic> map) {
    return GarageModel(
      id: map['id'] as int,
      level: map['level'] as int,
      experience: map['experience'] as int,
      broken: map['broken'] as bool,
      busted: map['busted'] as bool,
      car: Car.fromMap(map['car'] as Map<String, dynamic>),
    );
  }

  final int id;
  final int level;
  final int experience;
  final bool broken;
  final bool busted;
  final Car car;

  GarageModel copyWith({
    int? id,
    int? level,
    int? experience,
    bool? broken,
    bool? busted,
    Car? car,
  }) {
    return GarageModel(
      id: id ?? this.id,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      broken: broken ?? this.broken,
      busted: busted ?? this.busted,
      car: car ?? this.car,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'level': level,
      'experience': experience,
      'broken': broken,
      'busted': busted,
      'car': car.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}

class Car {
  Car({
    required this.id,
    required this.name,
    required this.image,
    required this.acceleration,
    required this.topSpeed,
    required this.control,
    required this.weight,
    required this.toughness,
    required this.potency,
    required this.nitro,
    required this.rarity,
    required this.carClass,
  });

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      acceleration: map['acceleration'] as int,
      topSpeed: map['topSpeed'] as int,
      control: map['control'] as int,
      weight: map['weight'] as int,
      toughness: map['toughness'] as int,
      potency: map['potency'] as int,
      nitro: map['nitro'] as int,
      rarity: map['rarity'] as String,
      carClass: map['carClass'] as String,
    );
  }

  final int id;
  final String name;
  final String image;
  final int acceleration;
  final int topSpeed;
  final int control;
  final int weight;
  final int toughness;
  final int potency;
  final int nitro;
  final String rarity;
  final String carClass;

  Car copyWith({
    int? id,
    String? name,
    String? image,
    int? acceleration,
    int? topSpeed,
    int? control,
    int? weight,
    int? toughness,
    int? potency,
    int? nitro,
    String? rarity,
    String? carClass,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      acceleration: acceleration ?? this.acceleration,
      topSpeed: topSpeed ?? this.topSpeed,
      control: control ?? this.control,
      weight: weight ?? this.weight,
      toughness: toughness ?? this.toughness,
      potency: potency ?? this.potency,
      nitro: nitro ?? this.nitro,
      rarity: rarity ?? this.rarity,
      carClass: carClass ?? this.carClass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'acceleration': acceleration,
      'topSpeed': topSpeed,
      'control': control,
      'weight': weight,
      'toughness': toughness,
      'potency': potency,
      'nitro': nitro,
      'rarity': rarity,
      'carClass': carClass,
    };
  }

  String toJson() => json.encode(toMap());
}
