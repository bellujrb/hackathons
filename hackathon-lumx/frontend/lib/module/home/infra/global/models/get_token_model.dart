class GetToken {
  String email;
  String uriToken;
  String auth;

  GetToken({required this.email, required this.uriToken, required this.auth});

  Map<String, String> toMap() {
    return {
      'email': email,
      'uriToken': uriToken,
      'auth': auth,
    };
  }
}
