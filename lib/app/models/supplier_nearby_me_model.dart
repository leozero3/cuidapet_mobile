// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SupplierNearbyMeModel {
  final int id;
  final String name;
  final String logo;
  final double distance;
  final int category;

  SupplierNearbyMeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.distance,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logo': logo,
      'distance': distance,
      'category': category,
    };
  }

  factory SupplierNearbyMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearbyMeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      distance: map['distance']?.toDouble() ?? 0.0,
      category: map['category']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearbyMeModel.fromJson(String source) =>
      SupplierNearbyMeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
