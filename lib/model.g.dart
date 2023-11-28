// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Way extends _Way with RealmEntity, RealmObjectBase, RealmObject {
  Way(
    int id,
    bool oneway, {
    String? name,
    Iterable<int> nodes = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'oneway', oneway);
    RealmObjectBase.set<RealmList<int>>(this, 'nodes', RealmList<int>(nodes));
  }

  Way._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  bool get oneway => RealmObjectBase.get<bool>(this, 'oneway') as bool;
  @override
  set oneway(bool value) => RealmObjectBase.set(this, 'oneway', value);

  @override
  RealmList<int> get nodes =>
      RealmObjectBase.get<int>(this, 'nodes') as RealmList<int>;
  @override
  set nodes(covariant RealmList<int> value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Way>> get changes =>
      RealmObjectBase.getChanges<Way>(this);

  @override
  Way freeze() => RealmObjectBase.freezeObject<Way>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Way._);
    return const SchemaObject(ObjectType.realmObject, Way, 'Way', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('oneway', RealmPropertyType.bool),
      SchemaProperty('nodes', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class Node extends _Node with RealmEntity, RealmObjectBase, RealmObject {
  Node(
    int id,
    double latitude,
    double longitude, {
    Iterable<int> ways = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
    RealmObjectBase.set<RealmList<int>>(this, 'ways', RealmList<int>(ways));
  }

  Node._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  double get latitude =>
      RealmObjectBase.get<double>(this, 'latitude') as double;
  @override
  set latitude(double value) => RealmObjectBase.set(this, 'latitude', value);

  @override
  double get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double;
  @override
  set longitude(double value) => RealmObjectBase.set(this, 'longitude', value);

  @override
  RealmList<int> get ways =>
      RealmObjectBase.get<int>(this, 'ways') as RealmList<int>;
  @override
  set ways(covariant RealmList<int> value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Node>> get changes =>
      RealmObjectBase.getChanges<Node>(this);

  @override
  Node freeze() => RealmObjectBase.freezeObject<Node>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Node._);
    return const SchemaObject(ObjectType.realmObject, Node, 'Node', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('latitude', RealmPropertyType.double),
      SchemaProperty('longitude', RealmPropertyType.double),
      SchemaProperty('ways', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class Connection extends _Connection
    with RealmEntity, RealmObjectBase, RealmObject {
  Connection(
    int n1,
    int n2,
    int way,
    double distance,
  ) {
    RealmObjectBase.set(this, 'n1', n1);
    RealmObjectBase.set(this, 'n2', n2);
    RealmObjectBase.set(this, 'way', way);
    RealmObjectBase.set(this, 'distance', distance);
  }

  Connection._();

  @override
  int get n1 => RealmObjectBase.get<int>(this, 'n1') as int;
  @override
  set n1(int value) => RealmObjectBase.set(this, 'n1', value);

  @override
  int get n2 => RealmObjectBase.get<int>(this, 'n2') as int;
  @override
  set n2(int value) => RealmObjectBase.set(this, 'n2', value);

  @override
  int get way => RealmObjectBase.get<int>(this, 'way') as int;
  @override
  set way(int value) => RealmObjectBase.set(this, 'way', value);

  @override
  double get distance =>
      RealmObjectBase.get<double>(this, 'distance') as double;
  @override
  set distance(double value) => RealmObjectBase.set(this, 'distance', value);

  @override
  Stream<RealmObjectChanges<Connection>> get changes =>
      RealmObjectBase.getChanges<Connection>(this);

  @override
  Connection freeze() => RealmObjectBase.freezeObject<Connection>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Connection._);
    return const SchemaObject(
        ObjectType.realmObject, Connection, 'Connection', [
      SchemaProperty('n1', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('n2', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('way', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('distance', RealmPropertyType.double),
    ]);
  }
}
