class LoginModel{
  String cpf;
  String password;

  LoginModel({required this.cpf, required this.password});

  Map<String, String>toMap(){
    return {
      'cpf': cpf,
      'password': password
    };
  }
}