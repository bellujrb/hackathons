class AllContract {
  String auth;

  AllContract({ required this.auth});

  Map<String, String> toMap() {
    return {
      'authorization': auth
    };
  }
}
