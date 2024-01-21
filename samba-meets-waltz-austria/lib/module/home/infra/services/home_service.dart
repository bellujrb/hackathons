import 'package:hackathon_austria/module/home/infra/interfaces/interface_request.dart';
import 'package:hackathon_austria/module/home/infra/models/home_model.dart';

class HomeService implements IRequest<HomeModel>{
  @override
  Future delete({required HomeModel type}) {
    throw UnimplementedError();
  }

  @override
  Future get({required HomeModel type}) {
    throw UnimplementedError();
  }

  @override
  Future post({required HomeModel type}) {
    throw UnimplementedError();
  }

  @override
  Future update({required HomeModel type}) {
    throw UnimplementedError();
  }

}