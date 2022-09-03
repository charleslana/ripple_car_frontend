import 'dart:convert';

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
    this.value,
  });

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      status: map['status'] as String,
      message: map['message'] as String,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

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

  String toJson() => json.encode(toMap());
}
