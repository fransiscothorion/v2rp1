// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Databes {
  static PostgreSQLConnection databaseConnection = PostgreSQLConnection(
    '10.0.2.2',
    5432,
    'kct2021',
    queryTimeoutInSeconds: 3600,
    timeoutInSeconds: 3600,
    username: 'postgres',
    password: 'Mu60Mu60150',
  );
  String username = '';
  initDatabaseConnection() async {
    databaseConnection.open().then((value) {
      debugPrint("Database Connected!");
    });
    List<Map<String, Map<String, dynamic>>> result = await databaseConnection
        .mappedResultsQuery(
            "SELECT userid, passwd FROM karyawan WHERE userid = @username",
            substitutionValues: {
          "username": username,
        });
    // if (username.isEmpty) {
  }
}
