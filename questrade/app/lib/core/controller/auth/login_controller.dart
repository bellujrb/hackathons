import 'package:app/core/model/auth/login_model.dart';
import 'package:flutter/material.dart';

import '../../interface/interface_request.dart';
import '../../repository/auth/service_login.dart';

class LoginController {
  IRequest authLogin = ServiceLogin();
  final controlEmail = TextEditingController();
  final controlPassword = TextEditingController();

  Future auth() async {
    return await authLogin.get(
      headers: LoginModel(
        email: controlEmail.text,
        password: controlPassword.text,
      ),
    );
  }

  Future logout() async {
    await authLogin.update(email: controlEmail.text);
  }
}
