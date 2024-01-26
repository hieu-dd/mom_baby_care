// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_db.dart';

// ignore_for_file: type=lint
class $BabyEntitiesTable extends BabyEntities
    with TableInfo<$BabyEntitiesTable, BabyEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BabyEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nicknameMeta =
      const VerificationMeta('nickname');
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
      'nickname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
      'birthday', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nickname, birthday, gender];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baby_entities';
  @override
  VerificationContext validateIntegrity(Insertable<BabyEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(_nicknameMeta,
          nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta));
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BabyEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BabyEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nickname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nickname'])!,
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birthday'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
    );
  }

  @override
  $BabyEntitiesTable createAlias(String alias) {
    return $BabyEntitiesTable(attachedDatabase, alias);
  }
}

class BabyEntity extends DataClass implements Insertable<BabyEntity> {
  final int id;
  final String name;
  final String nickname;
  final DateTime birthday;
  final String gender;
  const BabyEntity(
      {required this.id,
      required this.name,
      required this.nickname,
      required this.birthday,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['nickname'] = Variable<String>(nickname);
    map['birthday'] = Variable<DateTime>(birthday);
    map['gender'] = Variable<String>(gender);
    return map;
  }

  BabyEntitiesCompanion toCompanion(bool nullToAbsent) {
    return BabyEntitiesCompanion(
      id: Value(id),
      name: Value(name),
      nickname: Value(nickname),
      birthday: Value(birthday),
      gender: Value(gender),
    );
  }

  factory BabyEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BabyEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nickname: serializer.fromJson<String>(json['nickname']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      gender: serializer.fromJson<String>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nickname': serializer.toJson<String>(nickname),
      'birthday': serializer.toJson<DateTime>(birthday),
      'gender': serializer.toJson<String>(gender),
    };
  }

  BabyEntity copyWith(
          {int? id,
          String? name,
          String? nickname,
          DateTime? birthday,
          String? gender}) =>
      BabyEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        nickname: nickname ?? this.nickname,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('BabyEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('birthday: $birthday, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nickname, birthday, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BabyEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.nickname == this.nickname &&
          other.birthday == this.birthday &&
          other.gender == this.gender);
}

class BabyEntitiesCompanion extends UpdateCompanion<BabyEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> nickname;
  final Value<DateTime> birthday;
  final Value<String> gender;
  const BabyEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickname = const Value.absent(),
    this.birthday = const Value.absent(),
    this.gender = const Value.absent(),
  });
  BabyEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nickname,
    required DateTime birthday,
    required String gender,
  })  : name = Value(name),
        nickname = Value(nickname),
        birthday = Value(birthday),
        gender = Value(gender);
  static Insertable<BabyEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nickname,
    Expression<DateTime>? birthday,
    Expression<String>? gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nickname != null) 'nickname': nickname,
      if (birthday != null) 'birthday': birthday,
      if (gender != null) 'gender': gender,
    });
  }

  BabyEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? nickname,
      Value<DateTime>? birthday,
      Value<String>? gender}) {
    return BabyEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BabyEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('birthday: $birthday, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class $BabySizeEntitiesTable extends BabySizeEntities
    with TableInfo<$BabySizeEntitiesTable, BabySizeEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BabySizeEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _babyIdMeta = const VerificationMeta('babyId');
  @override
  late final GeneratedColumn<int> babyId = GeneratedColumn<int>(
      'baby_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _headSizeMeta =
      const VerificationMeta('headSize');
  @override
  late final GeneratedColumn<double> headSize = GeneratedColumn<double>(
      'head_size', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, babyId, headSize, weight, height, time];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baby_size_entities';
  @override
  VerificationContext validateIntegrity(Insertable<BabySizeEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('baby_id')) {
      context.handle(_babyIdMeta,
          babyId.isAcceptableOrUnknown(data['baby_id']!, _babyIdMeta));
    } else if (isInserting) {
      context.missing(_babyIdMeta);
    }
    if (data.containsKey('head_size')) {
      context.handle(_headSizeMeta,
          headSize.isAcceptableOrUnknown(data['head_size']!, _headSizeMeta));
    } else if (isInserting) {
      context.missing(_headSizeMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BabySizeEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BabySizeEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      babyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}baby_id'])!,
      headSize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}head_size'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $BabySizeEntitiesTable createAlias(String alias) {
    return $BabySizeEntitiesTable(attachedDatabase, alias);
  }
}

class BabySizeEntity extends DataClass implements Insertable<BabySizeEntity> {
  final int id;
  final int babyId;
  final double headSize;
  final double weight;
  final double height;
  final DateTime time;
  const BabySizeEntity(
      {required this.id,
      required this.babyId,
      required this.headSize,
      required this.weight,
      required this.height,
      required this.time});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['baby_id'] = Variable<int>(babyId);
    map['head_size'] = Variable<double>(headSize);
    map['weight'] = Variable<double>(weight);
    map['height'] = Variable<double>(height);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  BabySizeEntitiesCompanion toCompanion(bool nullToAbsent) {
    return BabySizeEntitiesCompanion(
      id: Value(id),
      babyId: Value(babyId),
      headSize: Value(headSize),
      weight: Value(weight),
      height: Value(height),
      time: Value(time),
    );
  }

  factory BabySizeEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BabySizeEntity(
      id: serializer.fromJson<int>(json['id']),
      babyId: serializer.fromJson<int>(json['babyId']),
      headSize: serializer.fromJson<double>(json['headSize']),
      weight: serializer.fromJson<double>(json['weight']),
      height: serializer.fromJson<double>(json['height']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'babyId': serializer.toJson<int>(babyId),
      'headSize': serializer.toJson<double>(headSize),
      'weight': serializer.toJson<double>(weight),
      'height': serializer.toJson<double>(height),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  BabySizeEntity copyWith(
          {int? id,
          int? babyId,
          double? headSize,
          double? weight,
          double? height,
          DateTime? time}) =>
      BabySizeEntity(
        id: id ?? this.id,
        babyId: babyId ?? this.babyId,
        headSize: headSize ?? this.headSize,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('BabySizeEntity(')
          ..write('id: $id, ')
          ..write('babyId: $babyId, ')
          ..write('headSize: $headSize, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, babyId, headSize, weight, height, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BabySizeEntity &&
          other.id == this.id &&
          other.babyId == this.babyId &&
          other.headSize == this.headSize &&
          other.weight == this.weight &&
          other.height == this.height &&
          other.time == this.time);
}

class BabySizeEntitiesCompanion extends UpdateCompanion<BabySizeEntity> {
  final Value<int> id;
  final Value<int> babyId;
  final Value<double> headSize;
  final Value<double> weight;
  final Value<double> height;
  final Value<DateTime> time;
  const BabySizeEntitiesCompanion({
    this.id = const Value.absent(),
    this.babyId = const Value.absent(),
    this.headSize = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.time = const Value.absent(),
  });
  BabySizeEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int babyId,
    required double headSize,
    required double weight,
    required double height,
    required DateTime time,
  })  : babyId = Value(babyId),
        headSize = Value(headSize),
        weight = Value(weight),
        height = Value(height),
        time = Value(time);
  static Insertable<BabySizeEntity> custom({
    Expression<int>? id,
    Expression<int>? babyId,
    Expression<double>? headSize,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (babyId != null) 'baby_id': babyId,
      if (headSize != null) 'head_size': headSize,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (time != null) 'time': time,
    });
  }

  BabySizeEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? babyId,
      Value<double>? headSize,
      Value<double>? weight,
      Value<double>? height,
      Value<DateTime>? time}) {
    return BabySizeEntitiesCompanion(
      id: id ?? this.id,
      babyId: babyId ?? this.babyId,
      headSize: headSize ?? this.headSize,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (babyId.present) {
      map['baby_id'] = Variable<int>(babyId.value);
    }
    if (headSize.present) {
      map['head_size'] = Variable<double>(headSize.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BabySizeEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('babyId: $babyId, ')
          ..write('headSize: $headSize, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

abstract class _$BabiesDatabase extends GeneratedDatabase {
  _$BabiesDatabase(QueryExecutor e) : super(e);
  late final $BabyEntitiesTable babyEntities = $BabyEntitiesTable(this);
  late final $BabySizeEntitiesTable babySizeEntities =
      $BabySizeEntitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [babyEntities, babySizeEntities];
}
