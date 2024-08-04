import 'dart:convert';

class SaleItem {
  int id;
  int amount;
  int invoiceNo;
  String customerName;
  String status;

  SaleItem({
    required this.id,
    required this.customerName,
    required this.amount,
    required this.invoiceNo,
    required this.status,
  });

  factory SaleItem.fromJson(Map<String, dynamic> json) => SaleItem(
    id: json["id"],
    customerName: json["customername"],
    invoiceNo: json["invoiceNo"],
    status: json["status"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customerName": customerName,
    "invoiceNo": invoiceNo,
    "status": status,
    "amount": amount,
  };
}
