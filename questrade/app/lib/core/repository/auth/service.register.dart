import 'dart:convert';

import 'package:app/core/interface/interface_request.dart';
import 'package:app/core/model/auth/register_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class ServiceRegister implements IRequest<RegisterModel>{
  Logger log = Logger();
  var url = Uri.parse("http://18.220.45.222:3000/loan");

  @override
  Future delete({required RegisterModel headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get({required RegisterModel headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post({required RegisterModel headers}) async{
    dynamic convertJson;
    dynamic result;
    try {
      result = await http.post(url, body: headers.toMap());
      convertJson = jsonDecode(result.body);
      if(result.statusCode == 200){
        Modular.to.navigate('home');
      }
    } catch (err){
      throw http.ClientException("Error HTTP: $err, STATUS: ${result.statusCode}");
    } finally {
      log.i(convertJson);
    }
  }

  @override
  Future update({required String email}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}