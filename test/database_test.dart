import 'dart:async';
import 'package:test/test.dart';
import 'package:realm_dart/realm.dart';
import 'package:database_mob/utils.dart';
import 'package:database_mob/model_rel.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:database_mob/database_mob.dart' as graph_database;

class TestRealm {
  late Stopwatch stopwatch;
  TestRealm() {
    stopwatch = Stopwatch()..start();
  }
  
FutureOr<void> graphExample() async {
    final config = Configuration.local(
        [Way.schema, Node.schema, Connection.schema],
        path: graph_database.realmDBName, isReadOnly: true);

    final realm = Realm(config);

    final center = LatLng(-3.77942, -38.48809);

    final p1 = SphericalUtil.computeOffset(center, 50, 180);
    final p2 = SphericalUtil.computeOffset(center, 50, 0);
    final p3 = SphericalUtil.computeOffset(center, 50, -90);
    final p4 = SphericalUtil.computeOffset(center, 50, 90);

    final graph_example = realm.query<Connection>(
        "(n1.latitude BETWEEN {\$0, \$1} AND n1.longitude BETWEEN {\$2, \$3}) OR (n2.latitude BETWEEN {\$0, \$1} AND n2.longitude BETWEEN {\$2, \$3})",
        [p1.latitude, p2.latitude, p3.longitude, p4.longitude]);

    final n = graph_example.reduce((c1, c2) {
      final d1 = PolygonUtil.distanceToLine(
          center,
          LatLng(c1.n1!.latitude, c1.n1!.longitude),
          LatLng(c1.n2!.latitude, c1.n2!.longitude));
      final d2 = PolygonUtil.distanceToLine(
          center,
          LatLng(c2.n1!.latitude, c2.n1!.longitude),
          LatLng(c2.n2!.latitude, c2.n2!.longitude));

      return (d1 < d2) ? c1 : c2;
    });

    final dist = PolygonUtil.distanceToLine(
        center,
        LatLng(n.n1!.latitude, n.n1!.longitude),
        LatLng(n.n2!.latitude, n.n2!.longitude));

    final snap = getSnapPointOnLine(
        center,
        LatLng(n.n1!.latitude, n.n1!.longitude),
        LatLng(n.n2!.latitude, n.n2!.longitude));

    print('Você está na aresta: ${n.way!.name}\ncom o id: ${n.way!.id}\nque é uma reta entre os nós ${n.n1!.id} e ${n.n2!.id}\ncom a distancia de $dist entre os pontos');

    // http://172.16.0.171:8080/nearest?point=-3.77942,-38.48809
  }
  FutureOr<void> testRealm() async {
    final config = Configuration.local(
        [Way.schema, Node.schema, Connection.schema],
        path: graph_database.realmDBName, isReadOnly: true);

    final realm = Realm(config);

    final center = LatLng(-3.77942, -38.48809);

    final p1 = SphericalUtil.computeOffset(center, 50, 180);
    final p2 = SphericalUtil.computeOffset(center, 50, 0);
    final p3 = SphericalUtil.computeOffset(center, 50, -90);
    final p4 = SphericalUtil.computeOffset(center, 50, 90);

    final result = realm.query<Node>(
        "latitude BETWEEN {\$0, \$1} AND longitude BETWEEN {\$2, \$3}",
        [p1.latitude, p2.latitude, p3.longitude, p4.longitude]);
    result.forEach((element) {
      print(element.id);
    });
    result
        .map((e) => {
              e.id: SphericalUtil.computeDistanceBetween(
                  center, LatLng(e.latitude, e.longitude))
            })
        .forEach((element) {
      print(element);
    });

    // final result2 = realm.query<Node>(
    //     "latitude BETWEEN {\$0, \$1} AND longitude BETWEEN {\$2, \$3}",
    //     [p1.latitude, p2.latitude, p3.longitude, p4.longitude]);

    // final n = result2.reduce((n1, n2) {
    //   final d1 = SphericalUtil.computeDistanceBetween(
    //       center, LatLng(n1.latitude, n1.longitude));
    //   final d2 = SphericalUtil.computeDistanceBetween(
    //       center, LatLng(n2.latitude, n2.longitude));

    //   return (d1 < d2) ? n1 : n2;
    // });

    // print('${n.id}');

    final result2 = realm.query<Connection>(
        "(n1.latitude BETWEEN {\$0, \$1} AND n1.longitude BETWEEN {\$2, \$3}) OR (n2.latitude BETWEEN {\$0, \$1} AND n2.longitude BETWEEN {\$2, \$3})",
        [p1.latitude, p2.latitude, p3.longitude, p4.longitude]);

    final n = result2.reduce((c1, c2) {
      final d1 = PolygonUtil.distanceToLine(
          center,
          LatLng(c1.n1!.latitude, c1.n1!.longitude),
          LatLng(c1.n2!.latitude, c1.n2!.longitude));
      final d2 = PolygonUtil.distanceToLine(
          center,
          LatLng(c2.n1!.latitude, c2.n1!.longitude),
          LatLng(c2.n2!.latitude, c2.n2!.longitude));

      return (d1 < d2) ? c1 : c2;
    });

    final dist = PolygonUtil.distanceToLine(
        center,
        LatLng(n.n1!.latitude, n.n1!.longitude),
        LatLng(n.n2!.latitude, n.n2!.longitude));

    final snap = getSnapPointOnLine(
        center,
        LatLng(n.n1!.latitude, n.n1!.longitude),
        LatLng(n.n2!.latitude, n.n2!.longitude));

    print('${n.n1!.id} -- ${n.n2!.id} -- ${n.way!.name} -- $dist -- $snap');

    // http://172.16.0.171:8080/nearest?point=-3.77942,-38.48809
  }

  Future<void> initDatabase() async {
    print('Initializing Realm DB ...');
    await graph_database.initDatabase();
    print('initDatabase() executed in ${stopwatch.elapsed}\n');
    stopwatch.reset();
  }

  Future<void> testDatabase() async {
    stopwatch.start();
    await testRealm();
    print('testRealm() executed in ${stopwatch.elapsed}\n');
    stopwatch.reset();
  }
}
