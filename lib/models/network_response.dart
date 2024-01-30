import 'dart:convert';

class NetworkResponse {
  final String message;
  
  NetworkResponse({required this.message});
  
  factory NetworkResponse.fromRawJson(String string) => NetworkResponse.fromJson(json.decode(string));
  
  factory NetworkResponse.fromJson(Map<String, dynamic> json) => NetworkResponse(message: json['message']);

  Map<String, dynamic> toJson () => {'message': message};
}