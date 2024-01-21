class EmailModel {
  String email;

  EmailModel({required this.email});

  Map<String, String>toMap(){
    return {
      'email': email
    };
  }
}