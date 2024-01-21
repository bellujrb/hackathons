import 'package:app/core/models/register_model.dart';
import 'package:app/core/repository/auth/service_register.dart';
import 'package:flutter/material.dart';

import '../interface/interface_request.dart';

class RegisterController {
  IRequest rService = ServiceRegister();
  final controlName = TextEditingController();
  final controlCpf = TextEditingController();
  final controlPassword = TextEditingController();
  final controlConfirmPassword = TextEditingController();

  Future register() async {
    rService.post(
        headers: RegisterModel(
      name: controlName.text,
      cpf: controlCpf.text,
      password: controlPassword.text,
      confirmPassword: controlPassword.text,
    ));
  }
}
