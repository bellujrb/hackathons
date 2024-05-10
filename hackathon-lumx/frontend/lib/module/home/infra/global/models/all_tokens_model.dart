class AllToken {
  String contractId;
  String auth;

  AllToken({ required this.contractId, required this.auth});

  Map<String, String> toMap() {
    return {
      'contractId': contractId,
      'authorization': auth
    };
  }
}
