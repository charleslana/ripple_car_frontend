// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
    this.value,
  });

  final String status;
  final String message;
  final String? value;

  ResponseModel copyWith({
    String? status,
    String? message,
    String? value,
  }) {
    return ResponseModel(
      status: status ?? this.status,
      message: message ?? this.message,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'value': value,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      status: map['status'] as String,
      message: map['message'] as String,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
