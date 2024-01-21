class RegisterModel {
  String name;
  String email;
  String phone;
  String cpf;
  String address;
  String current;
  String password;

  RegisterModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.cpf,
      required this.address,
      required this.current,
      required this.password});

  Map<String, String> toMap() {
    return {
      'name': name,
      'adress': address,
      'phone': phone,
      'current': current,
      'email': email,
      'userId': cpf,
      'password': password,
    };
  }
}
