import 'dart:convert';

import 'package:app/core/interface/interface_request.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../../model/auth/login_model.dart';
import 'package:http/http.dart' as http;

class ServiceLogin implements IRequest<LoginModel>{
  Logger log = Logger();
  var url = Uri.parse("http://18.220.45.222:3000/login");
  var urlLogout = Uri.parse("http://18.220.45.222:3000/logout");

  @override
  Future get({required LoginModel headers}) async {
    dynamic convertJson;
    dynamic result;
    try {
      result = await http.put(url, body: headers.toMap());
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
  Future delete({required headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future post({required headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future update({required email}) async{
    dynamic convertJson;
    dynamic result;
    try {
      result = await http.put(urlLogout, body: {
        'email': email
      });
      convertJson = jsonDecode(result.body);
      if (result.statusCode == 200) {
        Modular.to.navigate('/');
      }
    } catch (err){
      throw http.ClientException("Erro HTTP: $err, STATUS: ${result.statusCode}");
    } finally {
      log.i(convertJson);
    }
  }
  
}