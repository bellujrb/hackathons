import 'package:flutter_modular/flutter_modular.dart';

import '../../model/home/email_model.dart';
import '../../repository/home/service_home.dart';
import '../auth/login_controller.dart';

class HomeController {
  ServiceHome serviceHome = ServiceHome();
  final controller = Modular.get<LoginController>();

  String name = '';
  String address = '';
  String phone = '';
  int current = 0;
  String email = '';
  String userId = '';
  int score = 0;
  int loan = 0;

  Future<void> getData() async {
    var data = await serviceHome.get(
      headers: EmailModel(
        email: controller.controlEmail.text,
      ),
    );
    if (data.isNotEmpty) {
      Map<String, dynamic> firstData = data.first;
      name = firstData['name'];
      address = firstData['adress'];
      phone = firstData['phone'];
      current = firstData['current'];
      email = firstData['email'];
      userId = firstData['userId'];
      score = firstData['score'];
      loan = firstData['loan'];
    }
  }
}