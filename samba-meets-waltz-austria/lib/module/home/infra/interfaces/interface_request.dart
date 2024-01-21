abstract class IRequest<T>{
  Future<dynamic> get ({required T type});
  Future<dynamic> post ({required T type});
  Future<dynamic> update ({required T type});
  Future<dynamic> delete ({required T type});
}