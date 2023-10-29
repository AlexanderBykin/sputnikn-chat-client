// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_database.dart';

// ignore_for_file: type=lint
class $RoomTable extends Room with TableInfo<$RoomTable, RoomData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateUpdateMeta =
      const VerificationMeta('dateUpdate');
  @override
  late final GeneratedColumn<DateTime> dateUpdate = GeneratedColumn<DateTime>(
      'date_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, avatar, dateCreate, dateUpdate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room';
  @override
  VerificationContext validateIntegrity(Insertable<RoomData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_update')) {
      context.handle(
          _dateUpdateMeta,
          dateUpdate.isAcceptableOrUnknown(
              data['date_update']!, _dateUpdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar']),
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
      dateUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_update']),
    );
  }

  @override
  $RoomTable createAlias(String alias) {
    return $RoomTable(attachedDatabase, alias);
  }
}

class RoomData extends DataClass implements Insertable<RoomData> {
  final String id;
  final String title;
  final String? avatar;
  final DateTime dateCreate;
  final DateTime? dateUpdate;
  const RoomData(
      {required this.id,
      required this.title,
      this.avatar,
      required this.dateCreate,
      this.dateUpdate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['date_create'] = Variable<DateTime>(dateCreate);
    if (!nullToAbsent || dateUpdate != null) {
      map['date_update'] = Variable<DateTime>(dateUpdate);
    }
    return map;
  }

  RoomCompanion toCompanion(bool nullToAbsent) {
    return RoomCompanion(
      id: Value(id),
      title: Value(title),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      dateCreate: Value(dateCreate),
      dateUpdate: dateUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateUpdate),
    );
  }

  factory RoomData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
      dateUpdate: serializer.fromJson<DateTime?>(json['dateUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'avatar': serializer.toJson<String?>(avatar),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateUpdate': serializer.toJson<DateTime?>(dateUpdate),
    };
  }

  RoomData copyWith(
          {String? id,
          String? title,
          Value<String?> avatar = const Value.absent(),
          DateTime? dateCreate,
          Value<DateTime?> dateUpdate = const Value.absent()}) =>
      RoomData(
        id: id ?? this.id,
        title: title ?? this.title,
        avatar: avatar.present ? avatar.value : this.avatar,
        dateCreate: dateCreate ?? this.dateCreate,
        dateUpdate: dateUpdate.present ? dateUpdate.value : this.dateUpdate,
      );
  @override
  String toString() {
    return (StringBuffer('RoomData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('avatar: $avatar, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, avatar, dateCreate, dateUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomData &&
          other.id == this.id &&
          other.title == this.title &&
          other.avatar == this.avatar &&
          other.dateCreate == this.dateCreate &&
          other.dateUpdate == this.dateUpdate);
}

class RoomCompanion extends UpdateCompanion<RoomData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> avatar;
  final Value<DateTime> dateCreate;
  final Value<DateTime?> dateUpdate;
  final Value<int> rowid;
  const RoomCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.avatar = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomCompanion.insert({
    required String id,
    required String title,
    this.avatar = const Value.absent(),
    required DateTime dateCreate,
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        dateCreate = Value(dateCreate);
  static Insertable<RoomData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? avatar,
    Expression<DateTime>? dateCreate,
    Expression<DateTime>? dateUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (avatar != null) 'avatar': avatar,
      if (dateCreate != null) 'date_create': dateCreate,
      if (dateUpdate != null) 'date_update': dateUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? avatar,
      Value<DateTime>? dateCreate,
      Value<DateTime?>? dateUpdate,
      Value<int>? rowid}) {
    return RoomCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (dateUpdate.present) {
      map['date_update'] = Variable<DateTime>(dateUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('avatar: $avatar, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateUpdateMeta =
      const VerificationMeta('dateUpdate');
  @override
  late final GeneratedColumn<DateTime> dateUpdate = GeneratedColumn<DateTime>(
      'date_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, login, password, fullName, avatar, dateCreate, dateUpdate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_update')) {
      context.handle(
          _dateUpdateMeta,
          dateUpdate.isAcceptableOrUnknown(
              data['date_update']!, _dateUpdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      login: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar']),
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
      dateUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_update']),
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String? login;
  final String? password;
  final String fullName;
  final String? avatar;
  final DateTime dateCreate;
  final DateTime? dateUpdate;
  const UserData(
      {required this.id,
      this.login,
      this.password,
      required this.fullName,
      this.avatar,
      required this.dateCreate,
      this.dateUpdate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['date_create'] = Variable<DateTime>(dateCreate);
    if (!nullToAbsent || dateUpdate != null) {
      map['date_update'] = Variable<DateTime>(dateUpdate);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      login:
          login == null && nullToAbsent ? const Value.absent() : Value(login),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      fullName: Value(fullName),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      dateCreate: Value(dateCreate),
      dateUpdate: dateUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateUpdate),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      login: serializer.fromJson<String?>(json['login']),
      password: serializer.fromJson<String?>(json['password']),
      fullName: serializer.fromJson<String>(json['fullName']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
      dateUpdate: serializer.fromJson<DateTime?>(json['dateUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'login': serializer.toJson<String?>(login),
      'password': serializer.toJson<String?>(password),
      'fullName': serializer.toJson<String>(fullName),
      'avatar': serializer.toJson<String?>(avatar),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateUpdate': serializer.toJson<DateTime?>(dateUpdate),
    };
  }

  UserData copyWith(
          {String? id,
          Value<String?> login = const Value.absent(),
          Value<String?> password = const Value.absent(),
          String? fullName,
          Value<String?> avatar = const Value.absent(),
          DateTime? dateCreate,
          Value<DateTime?> dateUpdate = const Value.absent()}) =>
      UserData(
        id: id ?? this.id,
        login: login.present ? login.value : this.login,
        password: password.present ? password.value : this.password,
        fullName: fullName ?? this.fullName,
        avatar: avatar.present ? avatar.value : this.avatar,
        dateCreate: dateCreate ?? this.dateCreate,
        dateUpdate: dateUpdate.present ? dateUpdate.value : this.dateUpdate,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('fullName: $fullName, ')
          ..write('avatar: $avatar, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, login, password, fullName, avatar, dateCreate, dateUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.login == this.login &&
          other.password == this.password &&
          other.fullName == this.fullName &&
          other.avatar == this.avatar &&
          other.dateCreate == this.dateCreate &&
          other.dateUpdate == this.dateUpdate);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String?> login;
  final Value<String?> password;
  final Value<String> fullName;
  final Value<String?> avatar;
  final Value<DateTime> dateCreate;
  final Value<DateTime?> dateUpdate;
  final Value<int> rowid;
  const UserCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.fullName = const Value.absent(),
    this.avatar = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String id,
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    required String fullName,
    this.avatar = const Value.absent(),
    required DateTime dateCreate,
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fullName = Value(fullName),
        dateCreate = Value(dateCreate);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? fullName,
    Expression<String>? avatar,
    Expression<DateTime>? dateCreate,
    Expression<DateTime>? dateUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (fullName != null) 'full_name': fullName,
      if (avatar != null) 'avatar': avatar,
      if (dateCreate != null) 'date_create': dateCreate,
      if (dateUpdate != null) 'date_update': dateUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith(
      {Value<String>? id,
      Value<String?>? login,
      Value<String?>? password,
      Value<String>? fullName,
      Value<String?>? avatar,
      Value<DateTime>? dateCreate,
      Value<DateTime?>? dateUpdate,
      Value<int>? rowid}) {
    return UserCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (dateUpdate.present) {
      map['date_update'] = Variable<DateTime>(dateUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('fullName: $fullName, ')
          ..write('avatar: $avatar, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomEventMessageTable extends RoomEventMessage
    with TableInfo<$RoomEventMessageTable, RoomEventMessageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEventMessageTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
      'room_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES room (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user (id)'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _clientEventIdMeta =
      const VerificationMeta('clientEventId');
  @override
  late final GeneratedColumn<int> clientEventId = GeneratedColumn<int>(
      'client_event_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateEditMeta =
      const VerificationMeta('dateEdit');
  @override
  late final GeneratedColumn<DateTime> dateEdit = GeneratedColumn<DateTime>(
      'date_edit', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        roomId,
        userId,
        content,
        version,
        clientEventId,
        dateCreate,
        dateEdit
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_message';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomEventMessageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('client_event_id')) {
      context.handle(
          _clientEventIdMeta,
          clientEventId.isAcceptableOrUnknown(
              data['client_event_id']!, _clientEventIdMeta));
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_edit')) {
      context.handle(_dateEditMeta,
          dateEdit.isAcceptableOrUnknown(data['date_edit']!, _dateEditMeta));
    } else if (isInserting) {
      context.missing(_dateEditMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomEventMessageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEventMessageData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      clientEventId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_event_id']),
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
      dateEdit: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_edit'])!,
    );
  }

  @override
  $RoomEventMessageTable createAlias(String alias) {
    return $RoomEventMessageTable(attachedDatabase, alias);
  }
}

class RoomEventMessageData extends DataClass
    implements Insertable<RoomEventMessageData> {
  final String id;
  final String roomId;
  final String userId;
  final String content;
  final int version;
  final int? clientEventId;
  final DateTime dateCreate;
  final DateTime dateEdit;
  const RoomEventMessageData(
      {required this.id,
      required this.roomId,
      required this.userId,
      required this.content,
      required this.version,
      this.clientEventId,
      required this.dateCreate,
      required this.dateEdit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_id'] = Variable<String>(roomId);
    map['user_id'] = Variable<String>(userId);
    map['content'] = Variable<String>(content);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || clientEventId != null) {
      map['client_event_id'] = Variable<int>(clientEventId);
    }
    map['date_create'] = Variable<DateTime>(dateCreate);
    map['date_edit'] = Variable<DateTime>(dateEdit);
    return map;
  }

  RoomEventMessageCompanion toCompanion(bool nullToAbsent) {
    return RoomEventMessageCompanion(
      id: Value(id),
      roomId: Value(roomId),
      userId: Value(userId),
      content: Value(content),
      version: Value(version),
      clientEventId: clientEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientEventId),
      dateCreate: Value(dateCreate),
      dateEdit: Value(dateEdit),
    );
  }

  factory RoomEventMessageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventMessageData(
      id: serializer.fromJson<String>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      userId: serializer.fromJson<String>(json['userId']),
      content: serializer.fromJson<String>(json['content']),
      version: serializer.fromJson<int>(json['version']),
      clientEventId: serializer.fromJson<int?>(json['clientEventId']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
      dateEdit: serializer.fromJson<DateTime>(json['dateEdit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomId': serializer.toJson<String>(roomId),
      'userId': serializer.toJson<String>(userId),
      'content': serializer.toJson<String>(content),
      'version': serializer.toJson<int>(version),
      'clientEventId': serializer.toJson<int?>(clientEventId),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateEdit': serializer.toJson<DateTime>(dateEdit),
    };
  }

  RoomEventMessageData copyWith(
          {String? id,
          String? roomId,
          String? userId,
          String? content,
          int? version,
          Value<int?> clientEventId = const Value.absent(),
          DateTime? dateCreate,
          DateTime? dateEdit}) =>
      RoomEventMessageData(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        userId: userId ?? this.userId,
        content: content ?? this.content,
        version: version ?? this.version,
        clientEventId:
            clientEventId.present ? clientEventId.value : this.clientEventId,
        dateCreate: dateCreate ?? this.dateCreate,
        dateEdit: dateEdit ?? this.dateEdit,
      );
  @override
  String toString() {
    return (StringBuffer('RoomEventMessageData(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('content: $content, ')
          ..write('version: $version, ')
          ..write('clientEventId: $clientEventId, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateEdit: $dateEdit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomId, userId, content, version,
      clientEventId, dateCreate, dateEdit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEventMessageData &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.userId == this.userId &&
          other.content == this.content &&
          other.version == this.version &&
          other.clientEventId == this.clientEventId &&
          other.dateCreate == this.dateCreate &&
          other.dateEdit == this.dateEdit);
}

class RoomEventMessageCompanion extends UpdateCompanion<RoomEventMessageData> {
  final Value<String> id;
  final Value<String> roomId;
  final Value<String> userId;
  final Value<String> content;
  final Value<int> version;
  final Value<int?> clientEventId;
  final Value<DateTime> dateCreate;
  final Value<DateTime> dateEdit;
  final Value<int> rowid;
  const RoomEventMessageCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.userId = const Value.absent(),
    this.content = const Value.absent(),
    this.version = const Value.absent(),
    this.clientEventId = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.dateEdit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomEventMessageCompanion.insert({
    required String id,
    required String roomId,
    required String userId,
    required String content,
    required int version,
    this.clientEventId = const Value.absent(),
    required DateTime dateCreate,
    required DateTime dateEdit,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roomId = Value(roomId),
        userId = Value(userId),
        content = Value(content),
        version = Value(version),
        dateCreate = Value(dateCreate),
        dateEdit = Value(dateEdit);
  static Insertable<RoomEventMessageData> custom({
    Expression<String>? id,
    Expression<String>? roomId,
    Expression<String>? userId,
    Expression<String>? content,
    Expression<int>? version,
    Expression<int>? clientEventId,
    Expression<DateTime>? dateCreate,
    Expression<DateTime>? dateEdit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (userId != null) 'user_id': userId,
      if (content != null) 'content': content,
      if (version != null) 'version': version,
      if (clientEventId != null) 'client_event_id': clientEventId,
      if (dateCreate != null) 'date_create': dateCreate,
      if (dateEdit != null) 'date_edit': dateEdit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomEventMessageCompanion copyWith(
      {Value<String>? id,
      Value<String>? roomId,
      Value<String>? userId,
      Value<String>? content,
      Value<int>? version,
      Value<int?>? clientEventId,
      Value<DateTime>? dateCreate,
      Value<DateTime>? dateEdit,
      Value<int>? rowid}) {
    return RoomEventMessageCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      version: version ?? this.version,
      clientEventId: clientEventId ?? this.clientEventId,
      dateCreate: dateCreate ?? this.dateCreate,
      dateEdit: dateEdit ?? this.dateEdit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (clientEventId.present) {
      map['client_event_id'] = Variable<int>(clientEventId.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (dateEdit.present) {
      map['date_edit'] = Variable<DateTime>(dateEdit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomEventMessageCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('content: $content, ')
          ..write('version: $version, ')
          ..write('clientEventId: $clientEventId, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateEdit: $dateEdit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomEventMessageAttachmentTable extends RoomEventMessageAttachment
    with
        TableInfo<$RoomEventMessageAttachmentTable,
            RoomEventMessageAttachmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEventMessageAttachmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomEventMessageIdMeta =
      const VerificationMeta('roomEventMessageId');
  @override
  late final GeneratedColumn<String> roomEventMessageId =
      GeneratedColumn<String>('room_event_message_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES room_event_message (id)'));
  static const VerificationMeta _chatAttachmentIdMeta =
      const VerificationMeta('chatAttachmentId');
  @override
  late final GeneratedColumn<String> chatAttachmentId = GeneratedColumn<String>(
      'chat_attachment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomEventMessageId, chatAttachmentId, mimeType, dateCreate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_message_attachment';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomEventMessageAttachmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_event_message_id')) {
      context.handle(
          _roomEventMessageIdMeta,
          roomEventMessageId.isAcceptableOrUnknown(
              data['room_event_message_id']!, _roomEventMessageIdMeta));
    } else if (isInserting) {
      context.missing(_roomEventMessageIdMeta);
    }
    if (data.containsKey('chat_attachment_id')) {
      context.handle(
          _chatAttachmentIdMeta,
          chatAttachmentId.isAcceptableOrUnknown(
              data['chat_attachment_id']!, _chatAttachmentIdMeta));
    } else if (isInserting) {
      context.missing(_chatAttachmentIdMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {roomEventMessageId, chatAttachmentId},
      ];
  @override
  RoomEventMessageAttachmentData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEventMessageAttachmentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roomEventMessageId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}room_event_message_id'])!,
      chatAttachmentId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}chat_attachment_id'])!,
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type'])!,
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
    );
  }

  @override
  $RoomEventMessageAttachmentTable createAlias(String alias) {
    return $RoomEventMessageAttachmentTable(attachedDatabase, alias);
  }
}

class RoomEventMessageAttachmentData extends DataClass
    implements Insertable<RoomEventMessageAttachmentData> {
  final String id;
  final String roomEventMessageId;
  final String chatAttachmentId;
  final String mimeType;
  final DateTime dateCreate;
  const RoomEventMessageAttachmentData(
      {required this.id,
      required this.roomEventMessageId,
      required this.chatAttachmentId,
      required this.mimeType,
      required this.dateCreate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_event_message_id'] = Variable<String>(roomEventMessageId);
    map['chat_attachment_id'] = Variable<String>(chatAttachmentId);
    map['mime_type'] = Variable<String>(mimeType);
    map['date_create'] = Variable<DateTime>(dateCreate);
    return map;
  }

  RoomEventMessageAttachmentCompanion toCompanion(bool nullToAbsent) {
    return RoomEventMessageAttachmentCompanion(
      id: Value(id),
      roomEventMessageId: Value(roomEventMessageId),
      chatAttachmentId: Value(chatAttachmentId),
      mimeType: Value(mimeType),
      dateCreate: Value(dateCreate),
    );
  }

  factory RoomEventMessageAttachmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventMessageAttachmentData(
      id: serializer.fromJson<String>(json['id']),
      roomEventMessageId:
          serializer.fromJson<String>(json['roomEventMessageId']),
      chatAttachmentId: serializer.fromJson<String>(json['chatAttachmentId']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomEventMessageId': serializer.toJson<String>(roomEventMessageId),
      'chatAttachmentId': serializer.toJson<String>(chatAttachmentId),
      'mimeType': serializer.toJson<String>(mimeType),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
    };
  }

  RoomEventMessageAttachmentData copyWith(
          {String? id,
          String? roomEventMessageId,
          String? chatAttachmentId,
          String? mimeType,
          DateTime? dateCreate}) =>
      RoomEventMessageAttachmentData(
        id: id ?? this.id,
        roomEventMessageId: roomEventMessageId ?? this.roomEventMessageId,
        chatAttachmentId: chatAttachmentId ?? this.chatAttachmentId,
        mimeType: mimeType ?? this.mimeType,
        dateCreate: dateCreate ?? this.dateCreate,
      );
  @override
  String toString() {
    return (StringBuffer('RoomEventMessageAttachmentData(')
          ..write('id: $id, ')
          ..write('roomEventMessageId: $roomEventMessageId, ')
          ..write('chatAttachmentId: $chatAttachmentId, ')
          ..write('mimeType: $mimeType, ')
          ..write('dateCreate: $dateCreate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, roomEventMessageId, chatAttachmentId, mimeType, dateCreate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEventMessageAttachmentData &&
          other.id == this.id &&
          other.roomEventMessageId == this.roomEventMessageId &&
          other.chatAttachmentId == this.chatAttachmentId &&
          other.mimeType == this.mimeType &&
          other.dateCreate == this.dateCreate);
}

class RoomEventMessageAttachmentCompanion
    extends UpdateCompanion<RoomEventMessageAttachmentData> {
  final Value<String> id;
  final Value<String> roomEventMessageId;
  final Value<String> chatAttachmentId;
  final Value<String> mimeType;
  final Value<DateTime> dateCreate;
  final Value<int> rowid;
  const RoomEventMessageAttachmentCompanion({
    this.id = const Value.absent(),
    this.roomEventMessageId = const Value.absent(),
    this.chatAttachmentId = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomEventMessageAttachmentCompanion.insert({
    required String id,
    required String roomEventMessageId,
    required String chatAttachmentId,
    required String mimeType,
    required DateTime dateCreate,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roomEventMessageId = Value(roomEventMessageId),
        chatAttachmentId = Value(chatAttachmentId),
        mimeType = Value(mimeType),
        dateCreate = Value(dateCreate);
  static Insertable<RoomEventMessageAttachmentData> custom({
    Expression<String>? id,
    Expression<String>? roomEventMessageId,
    Expression<String>? chatAttachmentId,
    Expression<String>? mimeType,
    Expression<DateTime>? dateCreate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomEventMessageId != null)
        'room_event_message_id': roomEventMessageId,
      if (chatAttachmentId != null) 'chat_attachment_id': chatAttachmentId,
      if (mimeType != null) 'mime_type': mimeType,
      if (dateCreate != null) 'date_create': dateCreate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomEventMessageAttachmentCompanion copyWith(
      {Value<String>? id,
      Value<String>? roomEventMessageId,
      Value<String>? chatAttachmentId,
      Value<String>? mimeType,
      Value<DateTime>? dateCreate,
      Value<int>? rowid}) {
    return RoomEventMessageAttachmentCompanion(
      id: id ?? this.id,
      roomEventMessageId: roomEventMessageId ?? this.roomEventMessageId,
      chatAttachmentId: chatAttachmentId ?? this.chatAttachmentId,
      mimeType: mimeType ?? this.mimeType,
      dateCreate: dateCreate ?? this.dateCreate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomEventMessageId.present) {
      map['room_event_message_id'] = Variable<String>(roomEventMessageId.value);
    }
    if (chatAttachmentId.present) {
      map['chat_attachment_id'] = Variable<String>(chatAttachmentId.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomEventMessageAttachmentCompanion(')
          ..write('id: $id, ')
          ..write('roomEventMessageId: $roomEventMessageId, ')
          ..write('chatAttachmentId: $chatAttachmentId, ')
          ..write('mimeType: $mimeType, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomEventMessageReactionTable extends RoomEventMessageReaction
    with
        TableInfo<$RoomEventMessageReactionTable,
            RoomEventMessageReactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEventMessageReactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomEventMessageIdMeta =
      const VerificationMeta('roomEventMessageId');
  @override
  late final GeneratedColumn<String> roomEventMessageId =
      GeneratedColumn<String>('room_event_message_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES room_event_message (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user (id)'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomEventMessageId, userId, content, dateCreate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_message_reaction';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomEventMessageReactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_event_message_id')) {
      context.handle(
          _roomEventMessageIdMeta,
          roomEventMessageId.isAcceptableOrUnknown(
              data['room_event_message_id']!, _roomEventMessageIdMeta));
    } else if (isInserting) {
      context.missing(_roomEventMessageIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {roomEventMessageId, userId},
      ];
  @override
  RoomEventMessageReactionData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEventMessageReactionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roomEventMessageId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}room_event_message_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
    );
  }

  @override
  $RoomEventMessageReactionTable createAlias(String alias) {
    return $RoomEventMessageReactionTable(attachedDatabase, alias);
  }
}

class RoomEventMessageReactionData extends DataClass
    implements Insertable<RoomEventMessageReactionData> {
  final String id;
  final String roomEventMessageId;
  final String userId;
  final String content;
  final DateTime dateCreate;
  const RoomEventMessageReactionData(
      {required this.id,
      required this.roomEventMessageId,
      required this.userId,
      required this.content,
      required this.dateCreate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_event_message_id'] = Variable<String>(roomEventMessageId);
    map['user_id'] = Variable<String>(userId);
    map['content'] = Variable<String>(content);
    map['date_create'] = Variable<DateTime>(dateCreate);
    return map;
  }

  RoomEventMessageReactionCompanion toCompanion(bool nullToAbsent) {
    return RoomEventMessageReactionCompanion(
      id: Value(id),
      roomEventMessageId: Value(roomEventMessageId),
      userId: Value(userId),
      content: Value(content),
      dateCreate: Value(dateCreate),
    );
  }

  factory RoomEventMessageReactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventMessageReactionData(
      id: serializer.fromJson<String>(json['id']),
      roomEventMessageId:
          serializer.fromJson<String>(json['roomEventMessageId']),
      userId: serializer.fromJson<String>(json['userId']),
      content: serializer.fromJson<String>(json['content']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomEventMessageId': serializer.toJson<String>(roomEventMessageId),
      'userId': serializer.toJson<String>(userId),
      'content': serializer.toJson<String>(content),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
    };
  }

  RoomEventMessageReactionData copyWith(
          {String? id,
          String? roomEventMessageId,
          String? userId,
          String? content,
          DateTime? dateCreate}) =>
      RoomEventMessageReactionData(
        id: id ?? this.id,
        roomEventMessageId: roomEventMessageId ?? this.roomEventMessageId,
        userId: userId ?? this.userId,
        content: content ?? this.content,
        dateCreate: dateCreate ?? this.dateCreate,
      );
  @override
  String toString() {
    return (StringBuffer('RoomEventMessageReactionData(')
          ..write('id: $id, ')
          ..write('roomEventMessageId: $roomEventMessageId, ')
          ..write('userId: $userId, ')
          ..write('content: $content, ')
          ..write('dateCreate: $dateCreate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roomEventMessageId, userId, content, dateCreate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEventMessageReactionData &&
          other.id == this.id &&
          other.roomEventMessageId == this.roomEventMessageId &&
          other.userId == this.userId &&
          other.content == this.content &&
          other.dateCreate == this.dateCreate);
}

class RoomEventMessageReactionCompanion
    extends UpdateCompanion<RoomEventMessageReactionData> {
  final Value<String> id;
  final Value<String> roomEventMessageId;
  final Value<String> userId;
  final Value<String> content;
  final Value<DateTime> dateCreate;
  final Value<int> rowid;
  const RoomEventMessageReactionCompanion({
    this.id = const Value.absent(),
    this.roomEventMessageId = const Value.absent(),
    this.userId = const Value.absent(),
    this.content = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomEventMessageReactionCompanion.insert({
    required String id,
    required String roomEventMessageId,
    required String userId,
    required String content,
    required DateTime dateCreate,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roomEventMessageId = Value(roomEventMessageId),
        userId = Value(userId),
        content = Value(content),
        dateCreate = Value(dateCreate);
  static Insertable<RoomEventMessageReactionData> custom({
    Expression<String>? id,
    Expression<String>? roomEventMessageId,
    Expression<String>? userId,
    Expression<String>? content,
    Expression<DateTime>? dateCreate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomEventMessageId != null)
        'room_event_message_id': roomEventMessageId,
      if (userId != null) 'user_id': userId,
      if (content != null) 'content': content,
      if (dateCreate != null) 'date_create': dateCreate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomEventMessageReactionCompanion copyWith(
      {Value<String>? id,
      Value<String>? roomEventMessageId,
      Value<String>? userId,
      Value<String>? content,
      Value<DateTime>? dateCreate,
      Value<int>? rowid}) {
    return RoomEventMessageReactionCompanion(
      id: id ?? this.id,
      roomEventMessageId: roomEventMessageId ?? this.roomEventMessageId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      dateCreate: dateCreate ?? this.dateCreate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomEventMessageId.present) {
      map['room_event_message_id'] = Variable<String>(roomEventMessageId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomEventMessageReactionCompanion(')
          ..write('id: $id, ')
          ..write('roomEventMessageId: $roomEventMessageId, ')
          ..write('userId: $userId, ')
          ..write('content: $content, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomEventSystemTable extends RoomEventSystem
    with TableInfo<$RoomEventSystemTable, RoomEventSystemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEventSystemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
      'room_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomId, version, content, dateCreate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_system';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomEventSystemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomEventSystemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEventSystemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
    );
  }

  @override
  $RoomEventSystemTable createAlias(String alias) {
    return $RoomEventSystemTable(attachedDatabase, alias);
  }
}

class RoomEventSystemData extends DataClass
    implements Insertable<RoomEventSystemData> {
  final String id;
  final String roomId;
  final int version;
  final String content;
  final DateTime dateCreate;
  const RoomEventSystemData(
      {required this.id,
      required this.roomId,
      required this.version,
      required this.content,
      required this.dateCreate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_id'] = Variable<String>(roomId);
    map['version'] = Variable<int>(version);
    map['content'] = Variable<String>(content);
    map['date_create'] = Variable<DateTime>(dateCreate);
    return map;
  }

  RoomEventSystemCompanion toCompanion(bool nullToAbsent) {
    return RoomEventSystemCompanion(
      id: Value(id),
      roomId: Value(roomId),
      version: Value(version),
      content: Value(content),
      dateCreate: Value(dateCreate),
    );
  }

  factory RoomEventSystemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventSystemData(
      id: serializer.fromJson<String>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      version: serializer.fromJson<int>(json['version']),
      content: serializer.fromJson<String>(json['content']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomId': serializer.toJson<String>(roomId),
      'version': serializer.toJson<int>(version),
      'content': serializer.toJson<String>(content),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
    };
  }

  RoomEventSystemData copyWith(
          {String? id,
          String? roomId,
          int? version,
          String? content,
          DateTime? dateCreate}) =>
      RoomEventSystemData(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        version: version ?? this.version,
        content: content ?? this.content,
        dateCreate: dateCreate ?? this.dateCreate,
      );
  @override
  String toString() {
    return (StringBuffer('RoomEventSystemData(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('dateCreate: $dateCreate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomId, version, content, dateCreate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEventSystemData &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.version == this.version &&
          other.content == this.content &&
          other.dateCreate == this.dateCreate);
}

class RoomEventSystemCompanion extends UpdateCompanion<RoomEventSystemData> {
  final Value<String> id;
  final Value<String> roomId;
  final Value<int> version;
  final Value<String> content;
  final Value<DateTime> dateCreate;
  final Value<int> rowid;
  const RoomEventSystemCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.version = const Value.absent(),
    this.content = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomEventSystemCompanion.insert({
    required String id,
    required String roomId,
    required int version,
    required String content,
    required DateTime dateCreate,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roomId = Value(roomId),
        version = Value(version),
        content = Value(content),
        dateCreate = Value(dateCreate);
  static Insertable<RoomEventSystemData> custom({
    Expression<String>? id,
    Expression<String>? roomId,
    Expression<int>? version,
    Expression<String>? content,
    Expression<DateTime>? dateCreate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (version != null) 'version': version,
      if (content != null) 'content': content,
      if (dateCreate != null) 'date_create': dateCreate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomEventSystemCompanion copyWith(
      {Value<String>? id,
      Value<String>? roomId,
      Value<int>? version,
      Value<String>? content,
      Value<DateTime>? dateCreate,
      Value<int>? rowid}) {
    return RoomEventSystemCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      version: version ?? this.version,
      content: content ?? this.content,
      dateCreate: dateCreate ?? this.dateCreate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomEventSystemCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomMemberTable extends RoomMember
    with TableInfo<$RoomMemberTable, RoomMemberData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomMemberTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
      'room_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES room (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user (id)'));
  static const VerificationMeta _memberStatusMeta =
      const VerificationMeta('memberStatus');
  @override
  late final GeneratedColumnWithTypeConverter<MemberStatus, int> memberStatus =
      GeneratedColumn<int>('member_status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<MemberStatus>($RoomMemberTable.$convertermemberStatus);
  static const VerificationMeta _permissionMeta =
      const VerificationMeta('permission');
  @override
  late final GeneratedColumn<int> permission = GeneratedColumn<int>(
      'permission', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastReadMarkerMeta =
      const VerificationMeta('lastReadMarker');
  @override
  late final GeneratedColumn<DateTime> lastReadMarker =
      GeneratedColumn<DateTime>('last_read_marker', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateUpdateMeta =
      const VerificationMeta('dateUpdate');
  @override
  late final GeneratedColumn<DateTime> dateUpdate = GeneratedColumn<DateTime>(
      'date_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        roomId,
        userId,
        memberStatus,
        permission,
        lastReadMarker,
        dateCreate,
        dateUpdate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_member';
  @override
  VerificationContext validateIntegrity(Insertable<RoomMemberData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    context.handle(_memberStatusMeta, const VerificationResult.success());
    if (data.containsKey('permission')) {
      context.handle(
          _permissionMeta,
          permission.isAcceptableOrUnknown(
              data['permission']!, _permissionMeta));
    } else if (isInserting) {
      context.missing(_permissionMeta);
    }
    if (data.containsKey('last_read_marker')) {
      context.handle(
          _lastReadMarkerMeta,
          lastReadMarker.isAcceptableOrUnknown(
              data['last_read_marker']!, _lastReadMarkerMeta));
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_update')) {
      context.handle(
          _dateUpdateMeta,
          dateUpdate.isAcceptableOrUnknown(
              data['date_update']!, _dateUpdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roomId, userId};
  @override
  RoomMemberData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomMemberData(
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      memberStatus: $RoomMemberTable.$convertermemberStatus.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}member_status'])!),
      permission: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}permission'])!,
      lastReadMarker: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_read_marker']),
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create'])!,
      dateUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_update']),
    );
  }

  @override
  $RoomMemberTable createAlias(String alias) {
    return $RoomMemberTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MemberStatus, int, int> $convertermemberStatus =
      const EnumIndexConverter<MemberStatus>(MemberStatus.values);
}

class RoomMemberData extends DataClass implements Insertable<RoomMemberData> {
  final String roomId;
  final String userId;
  final MemberStatus memberStatus;
  final int permission;
  final DateTime? lastReadMarker;
  final DateTime dateCreate;
  final DateTime? dateUpdate;
  const RoomMemberData(
      {required this.roomId,
      required this.userId,
      required this.memberStatus,
      required this.permission,
      this.lastReadMarker,
      required this.dateCreate,
      this.dateUpdate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['room_id'] = Variable<String>(roomId);
    map['user_id'] = Variable<String>(userId);
    {
      final converter = $RoomMemberTable.$convertermemberStatus;
      map['member_status'] = Variable<int>(converter.toSql(memberStatus));
    }
    map['permission'] = Variable<int>(permission);
    if (!nullToAbsent || lastReadMarker != null) {
      map['last_read_marker'] = Variable<DateTime>(lastReadMarker);
    }
    map['date_create'] = Variable<DateTime>(dateCreate);
    if (!nullToAbsent || dateUpdate != null) {
      map['date_update'] = Variable<DateTime>(dateUpdate);
    }
    return map;
  }

  RoomMemberCompanion toCompanion(bool nullToAbsent) {
    return RoomMemberCompanion(
      roomId: Value(roomId),
      userId: Value(userId),
      memberStatus: Value(memberStatus),
      permission: Value(permission),
      lastReadMarker: lastReadMarker == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadMarker),
      dateCreate: Value(dateCreate),
      dateUpdate: dateUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateUpdate),
    );
  }

  factory RoomMemberData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomMemberData(
      roomId: serializer.fromJson<String>(json['roomId']),
      userId: serializer.fromJson<String>(json['userId']),
      memberStatus: $RoomMemberTable.$convertermemberStatus
          .fromJson(serializer.fromJson<int>(json['memberStatus'])),
      permission: serializer.fromJson<int>(json['permission']),
      lastReadMarker: serializer.fromJson<DateTime?>(json['lastReadMarker']),
      dateCreate: serializer.fromJson<DateTime>(json['dateCreate']),
      dateUpdate: serializer.fromJson<DateTime?>(json['dateUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'roomId': serializer.toJson<String>(roomId),
      'userId': serializer.toJson<String>(userId),
      'memberStatus': serializer.toJson<int>(
          $RoomMemberTable.$convertermemberStatus.toJson(memberStatus)),
      'permission': serializer.toJson<int>(permission),
      'lastReadMarker': serializer.toJson<DateTime?>(lastReadMarker),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateUpdate': serializer.toJson<DateTime?>(dateUpdate),
    };
  }

  RoomMemberData copyWith(
          {String? roomId,
          String? userId,
          MemberStatus? memberStatus,
          int? permission,
          Value<DateTime?> lastReadMarker = const Value.absent(),
          DateTime? dateCreate,
          Value<DateTime?> dateUpdate = const Value.absent()}) =>
      RoomMemberData(
        roomId: roomId ?? this.roomId,
        userId: userId ?? this.userId,
        memberStatus: memberStatus ?? this.memberStatus,
        permission: permission ?? this.permission,
        lastReadMarker:
            lastReadMarker.present ? lastReadMarker.value : this.lastReadMarker,
        dateCreate: dateCreate ?? this.dateCreate,
        dateUpdate: dateUpdate.present ? dateUpdate.value : this.dateUpdate,
      );
  @override
  String toString() {
    return (StringBuffer('RoomMemberData(')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('memberStatus: $memberStatus, ')
          ..write('permission: $permission, ')
          ..write('lastReadMarker: $lastReadMarker, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roomId, userId, memberStatus, permission,
      lastReadMarker, dateCreate, dateUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomMemberData &&
          other.roomId == this.roomId &&
          other.userId == this.userId &&
          other.memberStatus == this.memberStatus &&
          other.permission == this.permission &&
          other.lastReadMarker == this.lastReadMarker &&
          other.dateCreate == this.dateCreate &&
          other.dateUpdate == this.dateUpdate);
}

class RoomMemberCompanion extends UpdateCompanion<RoomMemberData> {
  final Value<String> roomId;
  final Value<String> userId;
  final Value<MemberStatus> memberStatus;
  final Value<int> permission;
  final Value<DateTime?> lastReadMarker;
  final Value<DateTime> dateCreate;
  final Value<DateTime?> dateUpdate;
  final Value<int> rowid;
  const RoomMemberCompanion({
    this.roomId = const Value.absent(),
    this.userId = const Value.absent(),
    this.memberStatus = const Value.absent(),
    this.permission = const Value.absent(),
    this.lastReadMarker = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomMemberCompanion.insert({
    required String roomId,
    required String userId,
    required MemberStatus memberStatus,
    required int permission,
    this.lastReadMarker = const Value.absent(),
    required DateTime dateCreate,
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : roomId = Value(roomId),
        userId = Value(userId),
        memberStatus = Value(memberStatus),
        permission = Value(permission),
        dateCreate = Value(dateCreate);
  static Insertable<RoomMemberData> custom({
    Expression<String>? roomId,
    Expression<String>? userId,
    Expression<int>? memberStatus,
    Expression<int>? permission,
    Expression<DateTime>? lastReadMarker,
    Expression<DateTime>? dateCreate,
    Expression<DateTime>? dateUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (roomId != null) 'room_id': roomId,
      if (userId != null) 'user_id': userId,
      if (memberStatus != null) 'member_status': memberStatus,
      if (permission != null) 'permission': permission,
      if (lastReadMarker != null) 'last_read_marker': lastReadMarker,
      if (dateCreate != null) 'date_create': dateCreate,
      if (dateUpdate != null) 'date_update': dateUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomMemberCompanion copyWith(
      {Value<String>? roomId,
      Value<String>? userId,
      Value<MemberStatus>? memberStatus,
      Value<int>? permission,
      Value<DateTime?>? lastReadMarker,
      Value<DateTime>? dateCreate,
      Value<DateTime?>? dateUpdate,
      Value<int>? rowid}) {
    return RoomMemberCompanion(
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      memberStatus: memberStatus ?? this.memberStatus,
      permission: permission ?? this.permission,
      lastReadMarker: lastReadMarker ?? this.lastReadMarker,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (memberStatus.present) {
      final converter = $RoomMemberTable.$convertermemberStatus;

      map['member_status'] = Variable<int>(converter.toSql(memberStatus.value));
    }
    if (permission.present) {
      map['permission'] = Variable<int>(permission.value);
    }
    if (lastReadMarker.present) {
      map['last_read_marker'] = Variable<DateTime>(lastReadMarker.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (dateUpdate.present) {
      map['date_update'] = Variable<DateTime>(dateUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomMemberCompanion(')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('memberStatus: $memberStatus, ')
          ..write('permission: $permission, ')
          ..write('lastReadMarker: $lastReadMarker, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserPushTable extends UserPush
    with TableInfo<$UserPushTable, UserPushData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPushTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user (id)'));
  static const VerificationMeta _deviceNameMeta =
      const VerificationMeta('deviceName');
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
      'device_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, deviceName, token];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_push';
  @override
  VerificationContext validateIntegrity(Insertable<UserPushData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('device_name')) {
      context.handle(
          _deviceNameMeta,
          deviceName.isAcceptableOrUnknown(
              data['device_name']!, _deviceNameMeta));
    } else if (isInserting) {
      context.missing(_deviceNameMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, deviceName},
      ];
  @override
  UserPushData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPushData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      deviceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_name'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $UserPushTable createAlias(String alias) {
    return $UserPushTable(attachedDatabase, alias);
  }
}

class UserPushData extends DataClass implements Insertable<UserPushData> {
  final String id;
  final String userId;
  final String deviceName;
  final String token;
  const UserPushData(
      {required this.id,
      required this.userId,
      required this.deviceName,
      required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['device_name'] = Variable<String>(deviceName);
    map['token'] = Variable<String>(token);
    return map;
  }

  UserPushCompanion toCompanion(bool nullToAbsent) {
    return UserPushCompanion(
      id: Value(id),
      userId: Value(userId),
      deviceName: Value(deviceName),
      token: Value(token),
    );
  }

  factory UserPushData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPushData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      deviceName: serializer.fromJson<String>(json['deviceName']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'deviceName': serializer.toJson<String>(deviceName),
      'token': serializer.toJson<String>(token),
    };
  }

  UserPushData copyWith(
          {String? id, String? userId, String? deviceName, String? token}) =>
      UserPushData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        deviceName: deviceName ?? this.deviceName,
        token: token ?? this.token,
      );
  @override
  String toString() {
    return (StringBuffer('UserPushData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('deviceName: $deviceName, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, deviceName, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPushData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.deviceName == this.deviceName &&
          other.token == this.token);
}

class UserPushCompanion extends UpdateCompanion<UserPushData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> deviceName;
  final Value<String> token;
  final Value<int> rowid;
  const UserPushCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.token = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPushCompanion.insert({
    required String id,
    required String userId,
    required String deviceName,
    required String token,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        deviceName = Value(deviceName),
        token = Value(token);
  static Insertable<UserPushData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? deviceName,
    Expression<String>? token,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (deviceName != null) 'device_name': deviceName,
      if (token != null) 'token': token,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPushCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? deviceName,
      Value<String>? token,
      Value<int>? rowid}) {
    return UserPushCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      deviceName: deviceName ?? this.deviceName,
      token: token ?? this.token,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (deviceName.present) {
      map['device_name'] = Variable<String>(deviceName.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPushCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('deviceName: $deviceName, ')
          ..write('token: $token, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ChatDatabase extends GeneratedDatabase {
  _$ChatDatabase(QueryExecutor e) : super(e);
  late final $RoomTable room = $RoomTable(this);
  late final $UserTable user = $UserTable(this);
  late final $RoomEventMessageTable roomEventMessage =
      $RoomEventMessageTable(this);
  late final $RoomEventMessageAttachmentTable roomEventMessageAttachment =
      $RoomEventMessageAttachmentTable(this);
  late final $RoomEventMessageReactionTable roomEventMessageReaction =
      $RoomEventMessageReactionTable(this);
  late final $RoomEventSystemTable roomEventSystem =
      $RoomEventSystemTable(this);
  late final $RoomMemberTable roomMember = $RoomMemberTable(this);
  late final $UserPushTable userPush = $UserPushTable(this);
  Selectable<int?> lastGeneratedEventMessageId(String userId) {
    return customSelect(
        'SELECT max(client_event_id) AS _c0 FROM room_event_message WHERE user_id = ?1',
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          roomEventMessage,
        }).map((QueryRow row) => row.readNullable<int>('_c0'));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        room,
        user,
        roomEventMessage,
        roomEventMessageAttachment,
        roomEventMessageReaction,
        roomEventSystem,
        roomMember,
        userPush
      ];
}
