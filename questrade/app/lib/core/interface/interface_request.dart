abstract class IRequest<T> {
  Future<dynamic> get({required T headers});
  Future<dynamic> post({required T headers});
  Future<dynamic> update({required String email});
  Future<dynamic> delete({required T headers});
}