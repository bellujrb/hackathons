import 'package:app/core/model/auth/register_model.dart';
import 'package:app/core/repository/auth/service.register.dart';
import 'package:flutter/cupertino.dart';

import '../../interface/interface_request.dart';

class RegisterController {
  IRequest authRegister = ServiceRegister();
  final controlName = TextEditingController();
  final controlEmail = TextEditingController();
  final controlPhone = TextEditingController();
  final controlCpf = TextEditingController();
  final controlAddress = TextEditingController();
  final controlCurrent = TextEditingController();
  final controlPassword = TextEditingController();

  Future register() async {
    return await authRegister.post(
      headers: RegisterModel(
        name: controlName.text,
        address: controlAddress.text,
        phone: controlPhone.text,
        current: controlCurrent.text,
        email: controlEmail.text,
        cpf: controlCpf.text,
        password: controlPassword.text,
      ),
    );
  }
}
