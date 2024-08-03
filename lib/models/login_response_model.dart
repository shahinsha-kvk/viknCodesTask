// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  int? success;
  Data? data;
  int? userId;
  String? role;
  String? message;
  dynamic error;
  String? username;

  LoginResponseModel({
    this.success,
    this.data,
    this.userId,
    this.role,
    this.message,
    this.error,
    this.username,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    userId: json["user_id"],
    role: json["role"],
    message: json["message"],
    error: json["error"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "user_id": userId,
    "role": role,
    "message": message,
    "error": error,
    "username": username,
  };
}

class Data {
  String? refresh;
  String? access;
  int? userId;
  String? role;
  String? username;
  String? email;
  DateTime? lastLogin;

  Data({
    this.refresh,
    this.access,
    this.userId,
    this.role,
    this.username,
    this.email,
    this.lastLogin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    refresh: json["refresh"],
    access: json["access"],
    userId: json["user_id"],
    role: json["role"],
    username: json["username"],
    email: json["email"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
    "user_id": userId,
    "role": role,
    "username": username,
    "email": email,
    "last_login": lastLogin?.toIso8601String(),
  };
}
