import 'package:app/core/repository/home/service_score.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../model/home/email_model.dart';
import '../auth/login_controller.dart';

class ScoreController {
  ServiceScore serviceScore = ServiceScore();
  final controller = Modular.get<LoginController>();

  int min = 200;
  int max = 1000;

  Future<void> getData() async {
    var data = await serviceScore.get(
      headers: EmailModel(
        email: controller.controlEmail.text,
      ),
    );
    if (data.isNotEmpty) {
      Map<String, dynamic> firstData = data.first;
      min = firstData['min'];
      max = firstData['max'];
    }
  }
}