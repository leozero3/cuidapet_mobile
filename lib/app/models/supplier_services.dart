import 'dart:convert';

class SupplierServices {
  final int id;
  final int supplierId;
  final String name;
  final double price;
  SupplierServices({
    required this.id,
    required this.supplierId,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'supplier_id': supplierId,
      'name': name,
      'price': price,
    };
  }

  factory SupplierServices.fromMap(Map<String, dynamic> map) {
    return SupplierServices(
      id: map['id']?.toInt() ?? 0,
      supplierId: map['supplier_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierServices.fromJson(String source) =>
      SupplierServices.fromMap(json.decode(source));
}
