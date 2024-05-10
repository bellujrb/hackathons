import 'package:frontend/module/auth/infra/auth/interfaces/interface_request.dart';
import 'package:frontend/module/auth/infra/auth/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService implements IRequest<LoginModel> {
  final String apiUrl = 'http://52.15.128.117:8080'; 

  @override
  Future<dynamic> get({required LoginModel headers}) async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> post({required LoginModel headers}) async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> update({required LoginModel headers}) async {
    try {
      var response = await http.put(
        Uri.parse("$apiUrl/login"), 
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': headers.email, 
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to update email with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send PUT request: $e');
    }
  }

  @override
  Future<dynamic> delete({required LoginModel headers}) async {
    throw UnimplementedError();
  }
}
