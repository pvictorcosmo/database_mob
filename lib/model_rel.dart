import 'package:realm_dart/realm.dart'; // import realm package

part 'model_rel.g.dart'; // declare a part file.

@RealmModel()
class _Way {
  @PrimaryKey()
  late int id;
  late String? name;
  late bool oneway;

  late List<_Node> nodes;
}

@RealmModel()
class _Node {
  @PrimaryKey()
  late int id;
  late double latitude;
  late double longitude;

  @Backlink(#nodes)
  late Iterable<_Way> ways;
}

@RealmModel()
class _Connection {
  _Node? n1;
  _Node? n2;
  _Way? way;

  late double distance;
}
