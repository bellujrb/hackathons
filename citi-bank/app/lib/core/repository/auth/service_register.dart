import 'dart:convert';

import 'package:app/core/interface/interface_request.dart';
import 'package:app/core/models/register_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ServiceRegister implements IRequest<RegisterModel>{
  
  final url = Uri.parse("http://13.59.255.127:3000/register");
  final log = Logger();

  @override
  Future get({required headers}) {
    throw UnimplementedError();
  }

  @override
  Future<void> post({required RegisterModel headers}) async{
    dynamic response;
    dynamic convertJson;
    try {
      response = await http.post(url, headers: headers.toMap()); 
      convertJson = jsonEncode(response.body);

      if (response.statusCode == 200){
        Modular.to.navigate('home');
        log.i("Response Success");
      }
    } catch (err){
      throw http.ClientException("Error HTTP! Status: ${response.statusCode}");
    } finally {
      log.i(convertJson);
    }
  }

  @override
  Future delete({required headers}) {
    throw UnimplementedError();
  }

  @override
  Future update({required headers}) {
    throw UnimplementedError();
  }

}