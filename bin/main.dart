import 'dart:io';

import 'package:database_mob/database_mob.dart' as graph_database;

import '../test/database_test.dart';

void main(List<String> arguments) async {
  TestRealm testDatabase = TestRealm();
  await testDatabase.testDatabase();

  // stopwatch.start();
  // print('Initializing SQLite DB ...');
  // await graph_database.initSQLDatabase();
  // print('initSQLDatabase() executed in ${stopwatch.elapsed}\n');
  // stopwatch.reset();

 // stopwatch.start();
  //await graph_database.testRealm();
  //print('testRealm() executed in ${stopwatch.elapsed}\n');
  //stopwatch.reset();

  //stopwatch.start();
  //await graph_database.testSQLite();
  //print('testSQLite() executed in ${stopwatch.elapsed}\n');
  //stopwatch.reset();

  exit(0);
}
