import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:database_mob/utils.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:realm_dart/realm.dart';

// import 'model.dart';
import 'model_rel.dart';

final realmDBName = '../database.realm';

// final prefix = 'test';
final prefix = 'fortaleza';

FutureOr<void> initDatabase() async {
  final [nodesInfo, waysInfo, edgesInfo] = await Future.wait([
    File('${prefix}_nodes.json').readAsString(),
    File('${prefix}_ways.json').readAsString(),
    File('${prefix}_edges.json').readAsString()
  ]);
  final List<dynamic> nodesJsonData = jsonDecode(nodesInfo);
  final List<dynamic> waysJsonData = jsonDecode(waysInfo);
  final List<dynamic> edgesJsonData = jsonDecode(edgesInfo);

  if (File(realmDBName).existsSync()) {
    File(realmDBName).deleteSync();
    File('$realmDBName.note').deleteSync();
    File('$realmDBName.lock').deleteSync();
  }

  final config = Configuration.local(
      [Way.schema, Node.schema, Connection.schema],
      path: realmDBName);

  final realm = Realm(config);

  // print('Initialize nodes ...');
  // final List<Node> nodes = nodesJsonData
  //     .map((n) =>
  //         Node(n['id'], n['lat'], n['lon'], ways: List.castFrom(n['ways'])))
  //     .toList();

  // print('Initialize ways ...');
  // final List<Way> ways = waysJsonData
  //     .map((w) => Way(w['id'], w['oneway'],
  //         name: w['name'], nodes: List.castFrom(w['nodes'])))
  //     .toList();

  // print('Initialize edges ...');
  // final edges = edgesJsonData
  //     .map((e) => Connection(e['n1'], e['n2'], e['way'], e['dist']));

  print('Initialize nodes ...');
  final List<Node> nodes =
      nodesJsonData.map((n) => Node(n['id'], n['lat'], n['lon'])).toList();

  print('Initialize ways ...');
  final List<Way> ways = waysJsonData.map((w) {
    final List<int> nodeIDs = List.castFrom(w['nodes']);
    final List<Node> n =
        nodeIDs.map((e) => nodes.where((n) => n.id == e).first).toList();
    return Way(w['id'], w['oneway'], name: w['name'], nodes: n);
  }).toList();

  print('Initialize edges ...');
  final edges = edgesJsonData.map((e) {
    final Node n1 = nodes.where((n) => n.id == e['n1']).first;
    final Node n2 = nodes.where((n) => n.id == e['n2']).first;
    final Way way = ways.where((w) => w.id == e['way']).first;
    return Connection(e['dist'], n1: n1, n2: n2, way: way);
  });

  print('Write to database ...');
  realm.write(() {
    realm.addAll(nodes);
    realm.addAll(ways);
    realm.addAll(edges);
  });

  realm.close();
}


