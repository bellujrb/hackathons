class ConverterTokenModel {
  String token;
  String auth;

  ConverterTokenModel({ required this.token, required this.auth});

  Map<String, String> toMap() {
    return {
      'token': token,
      'authorization': auth
    };
  }
}
