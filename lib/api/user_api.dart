import 'package:projeto_pmo/domain/user.dart';
import 'package:dio/dio.dart';

class UserApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/rlqmurilop09/api-fake-pmo';

  Future<List<User>> listarUsers() async {
    final response = await dio.get('$baseUrl/users');

    List<User> listarUsers = [];
    for (var json in response.data) {
      User user = User.fromJson(json);

      listarUsers.add(user);
    }

    await Future.delayed(Duration(seconds: 5));
    return listarUsers;
  }
}