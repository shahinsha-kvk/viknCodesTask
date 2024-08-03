import 'dart:convert';

class SaleItem {
  int id;
  String name;
  double price;
  // Add other fields as required

  SaleItem({
    required this.id,
    required this.name,
    required this.price,
  });

  factory SaleItem.fromJson(Map<String, dynamic> json) => SaleItem(
    id: json["id"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
  };
}
