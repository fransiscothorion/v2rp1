import 'package:postgres/postgres.dart';

// var databaseConnection = PostgreSQLConnection(
//   'localhost',
//   5432,
//   'kct2021',
//   queryTimeoutInSeconds: 3600,
//   timeoutInSeconds: 3600,
//   username: 'postgres',
//   password: 'Mu60Mu60150',
// );

// initDatabaseConnection() async {
//   databaseConnection.open().then((value) {
//     debugPrint("Database Connected!");
//   });
// }

class AppDatabase {
  String usernameValue = '';
  String passwordValue = '';

  PostgreSQLConnection? connection;
  PostgreSQLResult? loginResult;

  static String? usernameLogin;

  AppDatabase() {
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection(
            '10.0.2.2',
            5432,
            'kct2021',
            username: 'postgres',
            password: 'Mu60Mu60150',
            timeoutInSeconds: 30,
            queryTimeoutInSeconds: 30,
            useSSL: false,
            isUnixSocket: false,
          )
        : connection);
  }

  String userLoginFuture = '';
  Future<String> loginUser(String username, String password) async {
    try {
      await connection!.open();
      await connection!.transaction((loginConn) async {
        loginResult = await loginConn.query(
          'SELECT userid, passwd FROM public.karyawan WHERE userid = @usernameValue',
          substitutionValues: {'usernameValue': username},
          allowReuse: true,
          timeoutInSeconds: 30,
        );
        if (loginResult!.affectedRowCount > 0) {
          usernameLogin = loginResult!.first.elementAt(0);

          if (loginResult!.first.elementAt(1).contains(password) == true) {
            userLoginFuture = 'valid';
          } else {
            userLoginFuture = 'invalid';
          }
        } else {
          userLoginFuture = 'not';
        }
      });
    } catch (exc) {
      userLoginFuture = 'exc';
      exc.toString();
    }
    return userLoginFuture;
  }
}
