import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app/core/interface/interface_request.dart';
import 'package:app/core/model/home/email_model.dart';
import 'package:logger/logger.dart';

class ServiceHome implements IRequest<EmailModel> {
  var url = Uri.parse("http://18.220.45.222:3000/home");
  Logger log = Logger();
  late List<dynamic> data;

  ServiceHome() {
    data = [];
  }

  @override
  Future<dynamic> get({required EmailModel headers}) async {
    try {
      var result = await http.get(url, headers: headers.toMap());
      if (result.statusCode == 200) {
        var convertJson = jsonDecode(result.body);
        if (convertJson is List<dynamic>) {
          data = convertJson;
        } else if (convertJson is Map<String, dynamic>) {
          data = [convertJson];
        } else {
          throw FormatException('Unexpected JSON format');
        }
      } else {
        throw http.ClientException(
            'HTTP request failed with status: ${result.statusCode}');
      }
      return data;
    } catch (err) {
      throw http.ClientException('Error HTTP: $err');
    } finally {
      log.i(data);
    }
  }

  @override
  Future<dynamic> delete({required dynamic headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> post({required dynamic headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<dynamic> update({required String email}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}