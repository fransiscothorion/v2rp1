import 'package:v2rp1/BE/postgres.dart';

class ModelsUsers {
  String loginFuture = '';
  Future<String> userLoginModel(String username, String password) async {
    loginFuture = await AppDatabase().loginUser(username, password);
    return loginFuture;
  }
}
