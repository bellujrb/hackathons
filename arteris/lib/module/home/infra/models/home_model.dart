class HomeModel {
  String data;

  HomeModel({required this.data});

  Map<String, String>toMap(){
    return {
      'data': data
    };
  }
}
