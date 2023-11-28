// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_rel.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Way extends _Way with RealmEntity, RealmObjectBase, RealmObject {
  Way(
    int id,
    bool oneway, {
    String? name,
    Iterable<Node> nodes = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'oneway', oneway);
    RealmObjectBase.set<RealmList<Node>>(this, 'nodes', RealmList<Node>(nodes));
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
  RealmList<Node> get nodes =>
      RealmObjectBase.get<Node>(this, 'nodes') as RealmList<Node>;
  @override
  set nodes(covariant RealmList<Node> value) =>
      throw RealmUnsupportedSetError();

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
      SchemaProperty('nodes', RealmPropertyType.object,
          linkTarget: 'Node', collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class Node extends _Node with RealmEntity, RealmObjectBase, RealmObject {
  Node(
    int id,
    double latitude,
    double longitude,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
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
  RealmResults<Way> get ways {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<Way>(this, 'ways') as RealmResults<Way>;
  }

  @override
  set ways(covariant RealmResults<Way> value) =>
      throw RealmUnsupportedSetError();

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
      SchemaProperty('ways', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'nodes',
          collectionType: RealmCollectionType.list,
          linkTarget: 'Way'),
    ]);
  }
}

// ignore_for_file: type=lint
class Connection extends _Connection
    with RealmEntity, RealmObjectBase, RealmObject {
  Connection(
    double distance, {
    Node? n1,
    Node? n2,
    Way? way,
  }) {
    RealmObjectBase.set(this, 'n1', n1);
    RealmObjectBase.set(this, 'n2', n2);
    RealmObjectBase.set(this, 'way', way);
    RealmObjectBase.set(this, 'distance', distance);
  }

  Connection._();

  @override
  Node? get n1 => RealmObjectBase.get<Node>(this, 'n1') as Node?;
  @override
  set n1(covariant Node? value) => RealmObjectBase.set(this, 'n1', value);

  @override
  Node? get n2 => RealmObjectBase.get<Node>(this, 'n2') as Node?;
  @override
  set n2(covariant Node? value) => RealmObjectBase.set(this, 'n2', value);

  @override
  Way? get way => RealmObjectBase.get<Way>(this, 'way') as Way?;
  @override
  set way(covariant Way? value) => RealmObjectBase.set(this, 'way', value);

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
      SchemaProperty('n1', RealmPropertyType.object,
          optional: true, linkTarget: 'Node'),
      SchemaProperty('n2', RealmPropertyType.object,
          optional: true, linkTarget: 'Node'),
      SchemaProperty('way', RealmPropertyType.object,
          optional: true, linkTarget: 'Way'),
      SchemaProperty('distance', RealmPropertyType.double),
    ]);
  }
}
