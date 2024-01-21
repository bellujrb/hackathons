class RegisterModel{
  String name;
  String cpf;
  String password;
  String confirmPassword;

  RegisterModel({required this.name, required this.cpf, required this.password, required this.confirmPassword});

  Map<String, String>toMap(){
    return {
      'name': name,
      'cpf': cpf,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }
}