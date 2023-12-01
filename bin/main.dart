import 'dart:io';
import '../test/database_test.dart';
import 'package:database_mob/database_mob.dart' as graph_database;



void main(List<String> arguments) async {
  TestRealm testDatabase = TestRealm();
  await testDatabase.testDatabase();
  exit(0);
}
