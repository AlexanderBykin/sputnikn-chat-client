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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateUpdateMeta = const VerificationMeta(
    'dateUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> dateUpdate = GeneratedColumn<DateTime>(
    'date_update',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    avatar,
    dateCreate,
    dateUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_update')) {
      context.handle(
        _dateUpdateMeta,
        dateUpdate.isAcceptableOrUnknown(data['date_update']!, _dateUpdateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
      dateUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_update'],
      ),
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
  const RoomData({
    required this.id,
    required this.title,
    this.avatar,
    required this.dateCreate,
    this.dateUpdate,
  });
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
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      dateCreate: Value(dateCreate),
      dateUpdate: dateUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateUpdate),
    );
  }

  factory RoomData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  RoomData copyWith({
    String? id,
    String? title,
    Value<String?> avatar = const Value.absent(),
    DateTime? dateCreate,
    Value<DateTime?> dateUpdate = const Value.absent(),
  }) => RoomData(
    id: id ?? this.id,
    title: title ?? this.title,
    avatar: avatar.present ? avatar.value : this.avatar,
    dateCreate: dateCreate ?? this.dateCreate,
    dateUpdate: dateUpdate.present ? dateUpdate.value : this.dateUpdate,
  );
  RoomData copyWithCompanion(RoomCompanion data) {
    return RoomData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
      dateUpdate: data.dateUpdate.present
          ? data.dateUpdate.value
          : this.dateUpdate,
    );
  }

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
  }) : id = Value(id),
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

  RoomCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? avatar,
    Value<DateTime>? dateCreate,
    Value<DateTime?>? dateUpdate,
    Value<int>? rowid,
  }) {
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accessTokenMeta = const VerificationMeta(
    'accessToken',
  );
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
    'access_token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateUpdateMeta = const VerificationMeta(
    'dateUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> dateUpdate = GeneratedColumn<DateTime>(
    'date_update',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    login,
    password,
    fullName,
    avatar,
    accessToken,
    dateCreate,
    dateUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('access_token')) {
      context.handle(
        _accessTokenMeta,
        accessToken.isAcceptableOrUnknown(
          data['access_token']!,
          _accessTokenMeta,
        ),
      );
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_update')) {
      context.handle(
        _dateUpdateMeta,
        dateUpdate.isAcceptableOrUnknown(data['date_update']!, _dateUpdateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      accessToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_token'],
      ),
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
      dateUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_update'],
      ),
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
  final String? accessToken;
  final DateTime dateCreate;
  final DateTime? dateUpdate;
  const UserData({
    required this.id,
    this.login,
    this.password,
    required this.fullName,
    this.avatar,
    this.accessToken,
    required this.dateCreate,
    this.dateUpdate,
  });
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
    if (!nullToAbsent || accessToken != null) {
      map['access_token'] = Variable<String>(accessToken);
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
      login: login == null && nullToAbsent
          ? const Value.absent()
          : Value(login),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      fullName: Value(fullName),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      accessToken: accessToken == null && nullToAbsent
          ? const Value.absent()
          : Value(accessToken),
      dateCreate: Value(dateCreate),
      dateUpdate: dateUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateUpdate),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      login: serializer.fromJson<String?>(json['login']),
      password: serializer.fromJson<String?>(json['password']),
      fullName: serializer.fromJson<String>(json['fullName']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      accessToken: serializer.fromJson<String?>(json['accessToken']),
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
      'accessToken': serializer.toJson<String?>(accessToken),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateUpdate': serializer.toJson<DateTime?>(dateUpdate),
    };
  }

  UserData copyWith({
    String? id,
    Value<String?> login = const Value.absent(),
    Value<String?> password = const Value.absent(),
    String? fullName,
    Value<String?> avatar = const Value.absent(),
    Value<String?> accessToken = const Value.absent(),
    DateTime? dateCreate,
    Value<DateTime?> dateUpdate = const Value.absent(),
  }) => UserData(
    id: id ?? this.id,
    login: login.present ? login.value : this.login,
    password: password.present ? password.value : this.password,
    fullName: fullName ?? this.fullName,
    avatar: avatar.present ? avatar.value : this.avatar,
    accessToken: accessToken.present ? accessToken.value : this.accessToken,
    dateCreate: dateCreate ?? this.dateCreate,
    dateUpdate: dateUpdate.present ? dateUpdate.value : this.dateUpdate,
  );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      login: data.login.present ? data.login.value : this.login,
      password: data.password.present ? data.password.value : this.password,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      accessToken: data.accessToken.present
          ? data.accessToken.value
          : this.accessToken,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
      dateUpdate: data.dateUpdate.present
          ? data.dateUpdate.value
          : this.dateUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('fullName: $fullName, ')
          ..write('avatar: $avatar, ')
          ..write('accessToken: $accessToken, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateUpdate: $dateUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    login,
    password,
    fullName,
    avatar,
    accessToken,
    dateCreate,
    dateUpdate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.login == this.login &&
          other.password == this.password &&
          other.fullName == this.fullName &&
          other.avatar == this.avatar &&
          other.accessToken == this.accessToken &&
          other.dateCreate == this.dateCreate &&
          other.dateUpdate == this.dateUpdate);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String?> login;
  final Value<String?> password;
  final Value<String> fullName;
  final Value<String?> avatar;
  final Value<String?> accessToken;
  final Value<DateTime> dateCreate;
  final Value<DateTime?> dateUpdate;
  final Value<int> rowid;
  const UserCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.fullName = const Value.absent(),
    this.avatar = const Value.absent(),
    this.accessToken = const Value.absent(),
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
    this.accessToken = const Value.absent(),
    required DateTime dateCreate,
    this.dateUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fullName = Value(fullName),
       dateCreate = Value(dateCreate);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? fullName,
    Expression<String>? avatar,
    Expression<String>? accessToken,
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
      if (accessToken != null) 'access_token': accessToken,
      if (dateCreate != null) 'date_create': dateCreate,
      if (dateUpdate != null) 'date_update': dateUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith({
    Value<String>? id,
    Value<String?>? login,
    Value<String?>? password,
    Value<String>? fullName,
    Value<String?>? avatar,
    Value<String?>? accessToken,
    Value<DateTime>? dateCreate,
    Value<DateTime?>? dateUpdate,
    Value<int>? rowid,
  }) {
    return UserCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      accessToken: accessToken ?? this.accessToken,
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
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
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
          ..write('accessToken: $accessToken, ')
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES room (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (id)',
    ),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateEditMeta = const VerificationMeta(
    'dateEdit',
  );
  @override
  late final GeneratedColumn<DateTime> dateEdit = GeneratedColumn<DateTime>(
    'date_edit',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roomId,
    userId,
    content,
    version,
    dateCreate,
    dateEdit,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_message';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomEventMessageData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_edit')) {
      context.handle(
        _dateEditMeta,
        dateEdit.isAcceptableOrUnknown(data['date_edit']!, _dateEditMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
      dateEdit: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_edit'],
      )!,
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
  final DateTime dateCreate;
  final DateTime dateEdit;
  const RoomEventMessageData({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.content,
    required this.version,
    required this.dateCreate,
    required this.dateEdit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_id'] = Variable<String>(roomId);
    map['user_id'] = Variable<String>(userId);
    map['content'] = Variable<String>(content);
    map['version'] = Variable<int>(version);
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
      dateCreate: Value(dateCreate),
      dateEdit: Value(dateEdit),
    );
  }

  factory RoomEventMessageData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventMessageData(
      id: serializer.fromJson<String>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      userId: serializer.fromJson<String>(json['userId']),
      content: serializer.fromJson<String>(json['content']),
      version: serializer.fromJson<int>(json['version']),
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
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateEdit': serializer.toJson<DateTime>(dateEdit),
    };
  }

  RoomEventMessageData copyWith({
    String? id,
    String? roomId,
    String? userId,
    String? content,
    int? version,
    DateTime? dateCreate,
    DateTime? dateEdit,
  }) => RoomEventMessageData(
    id: id ?? this.id,
    roomId: roomId ?? this.roomId,
    userId: userId ?? this.userId,
    content: content ?? this.content,
    version: version ?? this.version,
    dateCreate: dateCreate ?? this.dateCreate,
    dateEdit: dateEdit ?? this.dateEdit,
  );
  RoomEventMessageData copyWithCompanion(RoomEventMessageCompanion data) {
    return RoomEventMessageData(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      userId: data.userId.present ? data.userId.value : this.userId,
      content: data.content.present ? data.content.value : this.content,
      version: data.version.present ? data.version.value : this.version,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
      dateEdit: data.dateEdit.present ? data.dateEdit.value : this.dateEdit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomEventMessageData(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('content: $content, ')
          ..write('version: $version, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('dateEdit: $dateEdit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roomId, userId, content, version, dateCreate, dateEdit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEventMessageData &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.userId == this.userId &&
          other.content == this.content &&
          other.version == this.version &&
          other.dateCreate == this.dateCreate &&
          other.dateEdit == this.dateEdit);
}

class RoomEventMessageCompanion extends UpdateCompanion<RoomEventMessageData> {
  final Value<String> id;
  final Value<String> roomId;
  final Value<String> userId;
  final Value<String> content;
  final Value<int> version;
  final Value<DateTime> dateCreate;
  final Value<DateTime> dateEdit;
  final Value<int> rowid;
  const RoomEventMessageCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.userId = const Value.absent(),
    this.content = const Value.absent(),
    this.version = const Value.absent(),
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
    required DateTime dateCreate,
    required DateTime dateEdit,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
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
      if (dateCreate != null) 'date_create': dateCreate,
      if (dateEdit != null) 'date_edit': dateEdit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomEventMessageCompanion copyWith({
    Value<String>? id,
    Value<String>? roomId,
    Value<String>? userId,
    Value<String>? content,
    Value<int>? version,
    Value<DateTime>? dateCreate,
    Value<DateTime>? dateEdit,
    Value<int>? rowid,
  }) {
    return RoomEventMessageCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      version: version ?? this.version,
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
          ..write('dateCreate: $dateCreate, ')
          ..write('dateEdit: $dateEdit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomEventMessageAttachmentTable extends RoomEventMessageAttachment
    with
        TableInfo<
          $RoomEventMessageAttachmentTable,
          RoomEventMessageAttachmentData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEventMessageAttachmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomEventMessageIdMeta =
      const VerificationMeta('roomEventMessageId');
  @override
  late final GeneratedColumn<String> roomEventMessageId =
      GeneratedColumn<String>(
        'room_event_message_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_event_message (id)',
        ),
      );
  static const VerificationMeta _chatAttachmentIdMeta = const VerificationMeta(
    'chatAttachmentId',
  );
  @override
  late final GeneratedColumn<String> chatAttachmentId = GeneratedColumn<String>(
    'chat_attachment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roomEventMessageId,
    chatAttachmentId,
    mimeType,
    dateCreate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_message_attachment';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomEventMessageAttachmentData> instance, {
    bool isInserting = false,
  }) {
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
          data['room_event_message_id']!,
          _roomEventMessageIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_roomEventMessageIdMeta);
    }
    if (data.containsKey('chat_attachment_id')) {
      context.handle(
        _chatAttachmentIdMeta,
        chatAttachmentId.isAcceptableOrUnknown(
          data['chat_attachment_id']!,
          _chatAttachmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chatAttachmentIdMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
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
  RoomEventMessageAttachmentData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEventMessageAttachmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roomEventMessageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_event_message_id'],
      )!,
      chatAttachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chat_attachment_id'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
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
  const RoomEventMessageAttachmentData({
    required this.id,
    required this.roomEventMessageId,
    required this.chatAttachmentId,
    required this.mimeType,
    required this.dateCreate,
  });
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

  factory RoomEventMessageAttachmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventMessageAttachmentData(
      id: serializer.fromJson<String>(json['id']),
      roomEventMessageId: serializer.fromJson<String>(
        json['roomEventMessageId'],
      ),
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

  RoomEventMessageAttachmentData copyWith({
    String? id,
    String? roomEventMessageId,
    String? chatAttachmentId,
    String? mimeType,
    DateTime? dateCreate,
  }) => RoomEventMessageAttachmentData(
    id: id ?? this.id,
    roomEventMessageId: roomEventMessageId ?? this.roomEventMessageId,
    chatAttachmentId: chatAttachmentId ?? this.chatAttachmentId,
    mimeType: mimeType ?? this.mimeType,
    dateCreate: dateCreate ?? this.dateCreate,
  );
  RoomEventMessageAttachmentData copyWithCompanion(
    RoomEventMessageAttachmentCompanion data,
  ) {
    return RoomEventMessageAttachmentData(
      id: data.id.present ? data.id.value : this.id,
      roomEventMessageId: data.roomEventMessageId.present
          ? data.roomEventMessageId.value
          : this.roomEventMessageId,
      chatAttachmentId: data.chatAttachmentId.present
          ? data.chatAttachmentId.value
          : this.chatAttachmentId,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
    );
  }

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
    id,
    roomEventMessageId,
    chatAttachmentId,
    mimeType,
    dateCreate,
  );
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
  }) : id = Value(id),
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

  RoomEventMessageAttachmentCompanion copyWith({
    Value<String>? id,
    Value<String>? roomEventMessageId,
    Value<String>? chatAttachmentId,
    Value<String>? mimeType,
    Value<DateTime>? dateCreate,
    Value<int>? rowid,
  }) {
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
        TableInfo<
          $RoomEventMessageReactionTable,
          RoomEventMessageReactionData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEventMessageReactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomEventMessageIdMeta =
      const VerificationMeta('roomEventMessageId');
  @override
  late final GeneratedColumn<String> roomEventMessageId =
      GeneratedColumn<String>(
        'room_event_message_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_event_message (id)',
        ),
      );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (id)',
    ),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roomEventMessageId,
    userId,
    content,
    dateCreate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_message_reaction';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomEventMessageReactionData> instance, {
    bool isInserting = false,
  }) {
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
          data['room_event_message_id']!,
          _roomEventMessageIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_roomEventMessageIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
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
  RoomEventMessageReactionData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEventMessageReactionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roomEventMessageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_event_message_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
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
  const RoomEventMessageReactionData({
    required this.id,
    required this.roomEventMessageId,
    required this.userId,
    required this.content,
    required this.dateCreate,
  });
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

  factory RoomEventMessageReactionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEventMessageReactionData(
      id: serializer.fromJson<String>(json['id']),
      roomEventMessageId: serializer.fromJson<String>(
        json['roomEventMessageId'],
      ),
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

  RoomEventMessageReactionData copyWith({
    String? id,
    String? roomEventMessageId,
    String? userId,
    String? content,
    DateTime? dateCreate,
  }) => RoomEventMessageReactionData(
    id: id ?? this.id,
    roomEventMessageId: roomEventMessageId ?? this.roomEventMessageId,
    userId: userId ?? this.userId,
    content: content ?? this.content,
    dateCreate: dateCreate ?? this.dateCreate,
  );
  RoomEventMessageReactionData copyWithCompanion(
    RoomEventMessageReactionCompanion data,
  ) {
    return RoomEventMessageReactionData(
      id: data.id.present ? data.id.value : this.id,
      roomEventMessageId: data.roomEventMessageId.present
          ? data.roomEventMessageId.value
          : this.roomEventMessageId,
      userId: data.userId.present ? data.userId.value : this.userId,
      content: data.content.present ? data.content.value : this.content,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
    );
  }

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
  }) : id = Value(id),
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

  RoomEventMessageReactionCompanion copyWith({
    Value<String>? id,
    Value<String>? roomEventMessageId,
    Value<String>? userId,
    Value<String>? content,
    Value<DateTime>? dateCreate,
    Value<int>? rowid,
  }) {
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roomId,
    version,
    content,
    dateCreate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_event_system';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomEventSystemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
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
  const RoomEventSystemData({
    required this.id,
    required this.roomId,
    required this.version,
    required this.content,
    required this.dateCreate,
  });
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

  factory RoomEventSystemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  RoomEventSystemData copyWith({
    String? id,
    String? roomId,
    int? version,
    String? content,
    DateTime? dateCreate,
  }) => RoomEventSystemData(
    id: id ?? this.id,
    roomId: roomId ?? this.roomId,
    version: version ?? this.version,
    content: content ?? this.content,
    dateCreate: dateCreate ?? this.dateCreate,
  );
  RoomEventSystemData copyWithCompanion(RoomEventSystemCompanion data) {
    return RoomEventSystemData(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      version: data.version.present ? data.version.value : this.version,
      content: data.content.present ? data.content.value : this.content,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
    );
  }

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
  }) : id = Value(id),
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

  RoomEventSystemCompanion copyWith({
    Value<String>? id,
    Value<String>? roomId,
    Value<int>? version,
    Value<String>? content,
    Value<DateTime>? dateCreate,
    Value<int>? rowid,
  }) {
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
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES room (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<MemberStatus, int> memberStatus =
      GeneratedColumn<int>(
        'member_status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<MemberStatus>($RoomMemberTable.$convertermemberStatus);
  static const VerificationMeta _permissionMeta = const VerificationMeta(
    'permission',
  );
  @override
  late final GeneratedColumn<int> permission = GeneratedColumn<int>(
    'permission',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReadMarkerMeta = const VerificationMeta(
    'lastReadMarker',
  );
  @override
  late final GeneratedColumn<DateTime> lastReadMarker =
      GeneratedColumn<DateTime>(
        'last_read_marker',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dateCreateMeta = const VerificationMeta(
    'dateCreate',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
    'date_create',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateUpdateMeta = const VerificationMeta(
    'dateUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> dateUpdate = GeneratedColumn<DateTime>(
    'date_update',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    roomId,
    userId,
    memberStatus,
    permission,
    lastReadMarker,
    dateCreate,
    dateUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_member';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomMemberData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('permission')) {
      context.handle(
        _permissionMeta,
        permission.isAcceptableOrUnknown(data['permission']!, _permissionMeta),
      );
    } else if (isInserting) {
      context.missing(_permissionMeta);
    }
    if (data.containsKey('last_read_marker')) {
      context.handle(
        _lastReadMarkerMeta,
        lastReadMarker.isAcceptableOrUnknown(
          data['last_read_marker']!,
          _lastReadMarkerMeta,
        ),
      );
    }
    if (data.containsKey('date_create')) {
      context.handle(
        _dateCreateMeta,
        dateCreate.isAcceptableOrUnknown(data['date_create']!, _dateCreateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateCreateMeta);
    }
    if (data.containsKey('date_update')) {
      context.handle(
        _dateUpdateMeta,
        dateUpdate.isAcceptableOrUnknown(data['date_update']!, _dateUpdateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roomId, userId};
  @override
  RoomMemberData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomMemberData(
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      memberStatus: $RoomMemberTable.$convertermemberStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}member_status'],
        )!,
      ),
      permission: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}permission'],
      )!,
      lastReadMarker: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_read_marker'],
      ),
      dateCreate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_create'],
      )!,
      dateUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_update'],
      ),
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
  const RoomMemberData({
    required this.roomId,
    required this.userId,
    required this.memberStatus,
    required this.permission,
    this.lastReadMarker,
    required this.dateCreate,
    this.dateUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['room_id'] = Variable<String>(roomId);
    map['user_id'] = Variable<String>(userId);
    {
      map['member_status'] = Variable<int>(
        $RoomMemberTable.$convertermemberStatus.toSql(memberStatus),
      );
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

  factory RoomMemberData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomMemberData(
      roomId: serializer.fromJson<String>(json['roomId']),
      userId: serializer.fromJson<String>(json['userId']),
      memberStatus: $RoomMemberTable.$convertermemberStatus.fromJson(
        serializer.fromJson<int>(json['memberStatus']),
      ),
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
        $RoomMemberTable.$convertermemberStatus.toJson(memberStatus),
      ),
      'permission': serializer.toJson<int>(permission),
      'lastReadMarker': serializer.toJson<DateTime?>(lastReadMarker),
      'dateCreate': serializer.toJson<DateTime>(dateCreate),
      'dateUpdate': serializer.toJson<DateTime?>(dateUpdate),
    };
  }

  RoomMemberData copyWith({
    String? roomId,
    String? userId,
    MemberStatus? memberStatus,
    int? permission,
    Value<DateTime?> lastReadMarker = const Value.absent(),
    DateTime? dateCreate,
    Value<DateTime?> dateUpdate = const Value.absent(),
  }) => RoomMemberData(
    roomId: roomId ?? this.roomId,
    userId: userId ?? this.userId,
    memberStatus: memberStatus ?? this.memberStatus,
    permission: permission ?? this.permission,
    lastReadMarker: lastReadMarker.present
        ? lastReadMarker.value
        : this.lastReadMarker,
    dateCreate: dateCreate ?? this.dateCreate,
    dateUpdate: dateUpdate.present ? dateUpdate.value : this.dateUpdate,
  );
  RoomMemberData copyWithCompanion(RoomMemberCompanion data) {
    return RoomMemberData(
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      userId: data.userId.present ? data.userId.value : this.userId,
      memberStatus: data.memberStatus.present
          ? data.memberStatus.value
          : this.memberStatus,
      permission: data.permission.present
          ? data.permission.value
          : this.permission,
      lastReadMarker: data.lastReadMarker.present
          ? data.lastReadMarker.value
          : this.lastReadMarker,
      dateCreate: data.dateCreate.present
          ? data.dateCreate.value
          : this.dateCreate,
      dateUpdate: data.dateUpdate.present
          ? data.dateUpdate.value
          : this.dateUpdate,
    );
  }

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
  int get hashCode => Object.hash(
    roomId,
    userId,
    memberStatus,
    permission,
    lastReadMarker,
    dateCreate,
    dateUpdate,
  );
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
  }) : roomId = Value(roomId),
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

  RoomMemberCompanion copyWith({
    Value<String>? roomId,
    Value<String>? userId,
    Value<MemberStatus>? memberStatus,
    Value<int>? permission,
    Value<DateTime?>? lastReadMarker,
    Value<DateTime>? dateCreate,
    Value<DateTime?>? dateUpdate,
    Value<int>? rowid,
  }) {
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
      map['member_status'] = Variable<int>(
        $RoomMemberTable.$convertermemberStatus.toSql(memberStatus.value),
      );
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (id)',
    ),
  );
  static const VerificationMeta _deviceNameMeta = const VerificationMeta(
    'deviceName',
  );
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
    'device_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, deviceName, token];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_push';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserPushData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('device_name')) {
      context.handle(
        _deviceNameMeta,
        deviceName.isAcceptableOrUnknown(data['device_name']!, _deviceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceNameMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      deviceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_name'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
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
  const UserPushData({
    required this.id,
    required this.userId,
    required this.deviceName,
    required this.token,
  });
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

  factory UserPushData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  UserPushData copyWith({
    String? id,
    String? userId,
    String? deviceName,
    String? token,
  }) => UserPushData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    deviceName: deviceName ?? this.deviceName,
    token: token ?? this.token,
  );
  UserPushData copyWithCompanion(UserPushCompanion data) {
    return UserPushData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      deviceName: data.deviceName.present
          ? data.deviceName.value
          : this.deviceName,
      token: data.token.present ? data.token.value : this.token,
    );
  }

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
  }) : id = Value(id),
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

  UserPushCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? deviceName,
    Value<String>? token,
    Value<int>? rowid,
  }) {
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
  $ChatDatabaseManager get managers => $ChatDatabaseManager(this);
  late final $RoomTable room = $RoomTable(this);
  late final $UserTable user = $UserTable(this);
  late final $RoomEventMessageTable roomEventMessage = $RoomEventMessageTable(
    this,
  );
  late final $RoomEventMessageAttachmentTable roomEventMessageAttachment =
      $RoomEventMessageAttachmentTable(this);
  late final $RoomEventMessageReactionTable roomEventMessageReaction =
      $RoomEventMessageReactionTable(this);
  late final $RoomEventSystemTable roomEventSystem = $RoomEventSystemTable(
    this,
  );
  late final $RoomMemberTable roomMember = $RoomMemberTable(this);
  late final $UserPushTable userPush = $UserPushTable(this);
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
    userPush,
  ];
}

typedef $$RoomTableCreateCompanionBuilder =
    RoomCompanion Function({
      required String id,
      required String title,
      Value<String?> avatar,
      required DateTime dateCreate,
      Value<DateTime?> dateUpdate,
      Value<int> rowid,
    });
typedef $$RoomTableUpdateCompanionBuilder =
    RoomCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> avatar,
      Value<DateTime> dateCreate,
      Value<DateTime?> dateUpdate,
      Value<int> rowid,
    });

final class $$RoomTableReferences
    extends BaseReferences<_$ChatDatabase, $RoomTable, RoomData> {
  $$RoomTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoomEventMessageTable, List<RoomEventMessageData>>
  _roomEventMessageRefsTable(_$ChatDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.roomEventMessage,
        aliasName: $_aliasNameGenerator(db.room.id, db.roomEventMessage.roomId),
      );

  $$RoomEventMessageTableProcessedTableManager get roomEventMessageRefs {
    final manager = $$RoomEventMessageTableTableManager(
      $_db,
      $_db.roomEventMessage,
    ).filter((f) => f.roomId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _roomEventMessageRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoomMemberTable, List<RoomMemberData>>
  _roomMemberRefsTable(_$ChatDatabase db) => MultiTypedResultKey.fromTable(
    db.roomMember,
    aliasName: $_aliasNameGenerator(db.room.id, db.roomMember.roomId),
  );

  $$RoomMemberTableProcessedTableManager get roomMemberRefs {
    final manager = $$RoomMemberTableTableManager(
      $_db,
      $_db.roomMember,
    ).filter((f) => f.roomId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomMemberRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoomTableFilterComposer extends Composer<_$ChatDatabase, $RoomTable> {
  $$RoomTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> roomEventMessageRefs(
    Expression<bool> Function($$RoomEventMessageTableFilterComposer f) f,
  ) {
    final $$RoomEventMessageTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableFilterComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> roomMemberRefs(
    Expression<bool> Function($$RoomMemberTableFilterComposer f) f,
  ) {
    final $$RoomMemberTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomMember,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomMemberTableFilterComposer(
            $db: $db,
            $table: $db.roomMember,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoomTableOrderingComposer extends Composer<_$ChatDatabase, $RoomTable> {
  $$RoomTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomTableAnnotationComposer
    extends Composer<_$ChatDatabase, $RoomTable> {
  $$RoomTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => column,
  );

  Expression<T> roomEventMessageRefs<T extends Object>(
    Expression<T> Function($$RoomEventMessageTableAnnotationComposer a) f,
  ) {
    final $$RoomEventMessageTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableAnnotationComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> roomMemberRefs<T extends Object>(
    Expression<T> Function($$RoomMemberTableAnnotationComposer a) f,
  ) {
    final $$RoomMemberTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomMember,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomMemberTableAnnotationComposer(
            $db: $db,
            $table: $db.roomMember,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoomTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $RoomTable,
          RoomData,
          $$RoomTableFilterComposer,
          $$RoomTableOrderingComposer,
          $$RoomTableAnnotationComposer,
          $$RoomTableCreateCompanionBuilder,
          $$RoomTableUpdateCompanionBuilder,
          (RoomData, $$RoomTableReferences),
          RoomData,
          PrefetchHooks Function({
            bool roomEventMessageRefs,
            bool roomMemberRefs,
          })
        > {
  $$RoomTableTableManager(_$ChatDatabase db, $RoomTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<DateTime?> dateUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomCompanion(
                id: id,
                title: title,
                avatar: avatar,
                dateCreate: dateCreate,
                dateUpdate: dateUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> avatar = const Value.absent(),
                required DateTime dateCreate,
                Value<DateTime?> dateUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomCompanion.insert(
                id: id,
                title: title,
                avatar: avatar,
                dateCreate: dateCreate,
                dateUpdate: dateUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RoomTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({roomEventMessageRefs = false, roomMemberRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roomEventMessageRefs) db.roomEventMessage,
                    if (roomMemberRefs) db.roomMember,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roomEventMessageRefs)
                        await $_getPrefetchedData<
                          RoomData,
                          $RoomTable,
                          RoomEventMessageData
                        >(
                          currentTable: table,
                          referencedTable: $$RoomTableReferences
                              ._roomEventMessageRefsTable(db),
                          managerFromTypedResult: (p0) => $$RoomTableReferences(
                            db,
                            table,
                            p0,
                          ).roomEventMessageRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roomId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (roomMemberRefs)
                        await $_getPrefetchedData<
                          RoomData,
                          $RoomTable,
                          RoomMemberData
                        >(
                          currentTable: table,
                          referencedTable: $$RoomTableReferences
                              ._roomMemberRefsTable(db),
                          managerFromTypedResult: (p0) => $$RoomTableReferences(
                            db,
                            table,
                            p0,
                          ).roomMemberRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roomId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoomTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $RoomTable,
      RoomData,
      $$RoomTableFilterComposer,
      $$RoomTableOrderingComposer,
      $$RoomTableAnnotationComposer,
      $$RoomTableCreateCompanionBuilder,
      $$RoomTableUpdateCompanionBuilder,
      (RoomData, $$RoomTableReferences),
      RoomData,
      PrefetchHooks Function({bool roomEventMessageRefs, bool roomMemberRefs})
    >;
typedef $$UserTableCreateCompanionBuilder =
    UserCompanion Function({
      required String id,
      Value<String?> login,
      Value<String?> password,
      required String fullName,
      Value<String?> avatar,
      Value<String?> accessToken,
      required DateTime dateCreate,
      Value<DateTime?> dateUpdate,
      Value<int> rowid,
    });
typedef $$UserTableUpdateCompanionBuilder =
    UserCompanion Function({
      Value<String> id,
      Value<String?> login,
      Value<String?> password,
      Value<String> fullName,
      Value<String?> avatar,
      Value<String?> accessToken,
      Value<DateTime> dateCreate,
      Value<DateTime?> dateUpdate,
      Value<int> rowid,
    });

final class $$UserTableReferences
    extends BaseReferences<_$ChatDatabase, $UserTable, UserData> {
  $$UserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoomEventMessageTable, List<RoomEventMessageData>>
  _roomEventMessageRefsTable(_$ChatDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.roomEventMessage,
        aliasName: $_aliasNameGenerator(db.user.id, db.roomEventMessage.userId),
      );

  $$RoomEventMessageTableProcessedTableManager get roomEventMessageRefs {
    final manager = $$RoomEventMessageTableTableManager(
      $_db,
      $_db.roomEventMessage,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _roomEventMessageRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RoomEventMessageReactionTable,
    List<RoomEventMessageReactionData>
  >
  _roomEventMessageReactionRefsTable(_$ChatDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.roomEventMessageReaction,
        aliasName: $_aliasNameGenerator(
          db.user.id,
          db.roomEventMessageReaction.userId,
        ),
      );

  $$RoomEventMessageReactionTableProcessedTableManager
  get roomEventMessageReactionRefs {
    final manager = $$RoomEventMessageReactionTableTableManager(
      $_db,
      $_db.roomEventMessageReaction,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _roomEventMessageReactionRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoomMemberTable, List<RoomMemberData>>
  _roomMemberRefsTable(_$ChatDatabase db) => MultiTypedResultKey.fromTable(
    db.roomMember,
    aliasName: $_aliasNameGenerator(db.user.id, db.roomMember.userId),
  );

  $$RoomMemberTableProcessedTableManager get roomMemberRefs {
    final manager = $$RoomMemberTableTableManager(
      $_db,
      $_db.roomMember,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomMemberRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserPushTable, List<UserPushData>>
  _userPushRefsTable(_$ChatDatabase db) => MultiTypedResultKey.fromTable(
    db.userPush,
    aliasName: $_aliasNameGenerator(db.user.id, db.userPush.userId),
  );

  $$UserPushTableProcessedTableManager get userPushRefs {
    final manager = $$UserPushTableTableManager(
      $_db,
      $_db.userPush,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userPushRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableFilterComposer extends Composer<_$ChatDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> roomEventMessageRefs(
    Expression<bool> Function($$RoomEventMessageTableFilterComposer f) f,
  ) {
    final $$RoomEventMessageTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableFilterComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> roomEventMessageReactionRefs(
    Expression<bool> Function($$RoomEventMessageReactionTableFilterComposer f)
    f,
  ) {
    final $$RoomEventMessageReactionTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.roomEventMessageReaction,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoomEventMessageReactionTableFilterComposer(
                $db: $db,
                $table: $db.roomEventMessageReaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> roomMemberRefs(
    Expression<bool> Function($$RoomMemberTableFilterComposer f) f,
  ) {
    final $$RoomMemberTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomMember,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomMemberTableFilterComposer(
            $db: $db,
            $table: $db.roomMember,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userPushRefs(
    Expression<bool> Function($$UserPushTableFilterComposer f) f,
  ) {
    final $$UserPushTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userPush,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserPushTableFilterComposer(
            $db: $db,
            $table: $db.userPush,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableOrderingComposer extends Composer<_$ChatDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableAnnotationComposer
    extends Composer<_$ChatDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => column,
  );

  Expression<T> roomEventMessageRefs<T extends Object>(
    Expression<T> Function($$RoomEventMessageTableAnnotationComposer a) f,
  ) {
    final $$RoomEventMessageTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableAnnotationComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> roomEventMessageReactionRefs<T extends Object>(
    Expression<T> Function($$RoomEventMessageReactionTableAnnotationComposer a)
    f,
  ) {
    final $$RoomEventMessageReactionTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.roomEventMessageReaction,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoomEventMessageReactionTableAnnotationComposer(
                $db: $db,
                $table: $db.roomEventMessageReaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> roomMemberRefs<T extends Object>(
    Expression<T> Function($$RoomMemberTableAnnotationComposer a) f,
  ) {
    final $$RoomMemberTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roomMember,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomMemberTableAnnotationComposer(
            $db: $db,
            $table: $db.roomMember,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userPushRefs<T extends Object>(
    Expression<T> Function($$UserPushTableAnnotationComposer a) f,
  ) {
    final $$UserPushTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userPush,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserPushTableAnnotationComposer(
            $db: $db,
            $table: $db.userPush,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $UserTable,
          UserData,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (UserData, $$UserTableReferences),
          UserData,
          PrefetchHooks Function({
            bool roomEventMessageRefs,
            bool roomEventMessageReactionRefs,
            bool roomMemberRefs,
            bool userPushRefs,
          })
        > {
  $$UserTableTableManager(_$ChatDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> login = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String?> accessToken = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<DateTime?> dateUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion(
                id: id,
                login: login,
                password: password,
                fullName: fullName,
                avatar: avatar,
                accessToken: accessToken,
                dateCreate: dateCreate,
                dateUpdate: dateUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> login = const Value.absent(),
                Value<String?> password = const Value.absent(),
                required String fullName,
                Value<String?> avatar = const Value.absent(),
                Value<String?> accessToken = const Value.absent(),
                required DateTime dateCreate,
                Value<DateTime?> dateUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion.insert(
                id: id,
                login: login,
                password: password,
                fullName: fullName,
                avatar: avatar,
                accessToken: accessToken,
                dateCreate: dateCreate,
                dateUpdate: dateUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UserTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roomEventMessageRefs = false,
                roomEventMessageReactionRefs = false,
                roomMemberRefs = false,
                userPushRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roomEventMessageRefs) db.roomEventMessage,
                    if (roomEventMessageReactionRefs)
                      db.roomEventMessageReaction,
                    if (roomMemberRefs) db.roomMember,
                    if (userPushRefs) db.userPush,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roomEventMessageRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          RoomEventMessageData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._roomEventMessageRefsTable(db),
                          managerFromTypedResult: (p0) => $$UserTableReferences(
                            db,
                            table,
                            p0,
                          ).roomEventMessageRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (roomEventMessageReactionRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          RoomEventMessageReactionData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._roomEventMessageReactionRefsTable(db),
                          managerFromTypedResult: (p0) => $$UserTableReferences(
                            db,
                            table,
                            p0,
                          ).roomEventMessageReactionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (roomMemberRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          RoomMemberData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._roomMemberRefsTable(db),
                          managerFromTypedResult: (p0) => $$UserTableReferences(
                            db,
                            table,
                            p0,
                          ).roomMemberRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userPushRefs)
                        await $_getPrefetchedData<
                          UserData,
                          $UserTable,
                          UserPushData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableReferences
                              ._userPushRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableReferences(db, table, p0).userPushRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $UserTable,
      UserData,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (UserData, $$UserTableReferences),
      UserData,
      PrefetchHooks Function({
        bool roomEventMessageRefs,
        bool roomEventMessageReactionRefs,
        bool roomMemberRefs,
        bool userPushRefs,
      })
    >;
typedef $$RoomEventMessageTableCreateCompanionBuilder =
    RoomEventMessageCompanion Function({
      required String id,
      required String roomId,
      required String userId,
      required String content,
      required int version,
      required DateTime dateCreate,
      required DateTime dateEdit,
      Value<int> rowid,
    });
typedef $$RoomEventMessageTableUpdateCompanionBuilder =
    RoomEventMessageCompanion Function({
      Value<String> id,
      Value<String> roomId,
      Value<String> userId,
      Value<String> content,
      Value<int> version,
      Value<DateTime> dateCreate,
      Value<DateTime> dateEdit,
      Value<int> rowid,
    });

final class $$RoomEventMessageTableReferences
    extends
        BaseReferences<
          _$ChatDatabase,
          $RoomEventMessageTable,
          RoomEventMessageData
        > {
  $$RoomEventMessageTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoomTable _roomIdTable(_$ChatDatabase db) => db.room.createAlias(
    $_aliasNameGenerator(db.roomEventMessage.roomId, db.room.id),
  );

  $$RoomTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<String>('room_id')!;

    final manager = $$RoomTableTableManager(
      $_db,
      $_db.room,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserTable _userIdTable(_$ChatDatabase db) => db.user.createAlias(
    $_aliasNameGenerator(db.roomEventMessage.userId, db.user.id),
  );

  $$UserTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RoomEventMessageAttachmentTable,
    List<RoomEventMessageAttachmentData>
  >
  _roomEventMessageAttachmentRefsTable(_$ChatDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.roomEventMessageAttachment,
        aliasName: $_aliasNameGenerator(
          db.roomEventMessage.id,
          db.roomEventMessageAttachment.roomEventMessageId,
        ),
      );

  $$RoomEventMessageAttachmentTableProcessedTableManager
  get roomEventMessageAttachmentRefs {
    final manager =
        $$RoomEventMessageAttachmentTableTableManager(
          $_db,
          $_db.roomEventMessageAttachment,
        ).filter(
          (f) => f.roomEventMessageId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _roomEventMessageAttachmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RoomEventMessageReactionTable,
    List<RoomEventMessageReactionData>
  >
  _roomEventMessageReactionRefsTable(_$ChatDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.roomEventMessageReaction,
        aliasName: $_aliasNameGenerator(
          db.roomEventMessage.id,
          db.roomEventMessageReaction.roomEventMessageId,
        ),
      );

  $$RoomEventMessageReactionTableProcessedTableManager
  get roomEventMessageReactionRefs {
    final manager =
        $$RoomEventMessageReactionTableTableManager(
          $_db,
          $_db.roomEventMessageReaction,
        ).filter(
          (f) => f.roomEventMessageId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _roomEventMessageReactionRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoomEventMessageTableFilterComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageTable> {
  $$RoomEventMessageTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateEdit => $composableBuilder(
    column: $table.dateEdit,
    builder: (column) => ColumnFilters(column),
  );

  $$RoomTableFilterComposer get roomId {
    final $$RoomTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.room,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomTableFilterComposer(
            $db: $db,
            $table: $db.room,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableFilterComposer get userId {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> roomEventMessageAttachmentRefs(
    Expression<bool> Function($$RoomEventMessageAttachmentTableFilterComposer f)
    f,
  ) {
    final $$RoomEventMessageAttachmentTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.roomEventMessageAttachment,
          getReferencedColumn: (t) => t.roomEventMessageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoomEventMessageAttachmentTableFilterComposer(
                $db: $db,
                $table: $db.roomEventMessageAttachment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> roomEventMessageReactionRefs(
    Expression<bool> Function($$RoomEventMessageReactionTableFilterComposer f)
    f,
  ) {
    final $$RoomEventMessageReactionTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.roomEventMessageReaction,
          getReferencedColumn: (t) => t.roomEventMessageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoomEventMessageReactionTableFilterComposer(
                $db: $db,
                $table: $db.roomEventMessageReaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoomEventMessageTableOrderingComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageTable> {
  $$RoomEventMessageTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateEdit => $composableBuilder(
    column: $table.dateEdit,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoomTableOrderingComposer get roomId {
    final $$RoomTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.room,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomTableOrderingComposer(
            $db: $db,
            $table: $db.room,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableOrderingComposer get userId {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageTableAnnotationComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageTable> {
  $$RoomEventMessageTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateEdit =>
      $composableBuilder(column: $table.dateEdit, builder: (column) => column);

  $$RoomTableAnnotationComposer get roomId {
    final $$RoomTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.room,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomTableAnnotationComposer(
            $db: $db,
            $table: $db.room,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableAnnotationComposer get userId {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> roomEventMessageAttachmentRefs<T extends Object>(
    Expression<T> Function(
      $$RoomEventMessageAttachmentTableAnnotationComposer a,
    )
    f,
  ) {
    final $$RoomEventMessageAttachmentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.roomEventMessageAttachment,
          getReferencedColumn: (t) => t.roomEventMessageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoomEventMessageAttachmentTableAnnotationComposer(
                $db: $db,
                $table: $db.roomEventMessageAttachment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> roomEventMessageReactionRefs<T extends Object>(
    Expression<T> Function($$RoomEventMessageReactionTableAnnotationComposer a)
    f,
  ) {
    final $$RoomEventMessageReactionTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.roomEventMessageReaction,
          getReferencedColumn: (t) => t.roomEventMessageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RoomEventMessageReactionTableAnnotationComposer(
                $db: $db,
                $table: $db.roomEventMessageReaction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoomEventMessageTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $RoomEventMessageTable,
          RoomEventMessageData,
          $$RoomEventMessageTableFilterComposer,
          $$RoomEventMessageTableOrderingComposer,
          $$RoomEventMessageTableAnnotationComposer,
          $$RoomEventMessageTableCreateCompanionBuilder,
          $$RoomEventMessageTableUpdateCompanionBuilder,
          (RoomEventMessageData, $$RoomEventMessageTableReferences),
          RoomEventMessageData,
          PrefetchHooks Function({
            bool roomId,
            bool userId,
            bool roomEventMessageAttachmentRefs,
            bool roomEventMessageReactionRefs,
          })
        > {
  $$RoomEventMessageTableTableManager(
    _$ChatDatabase db,
    $RoomEventMessageTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomEventMessageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomEventMessageTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomEventMessageTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roomId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<DateTime> dateEdit = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomEventMessageCompanion(
                id: id,
                roomId: roomId,
                userId: userId,
                content: content,
                version: version,
                dateCreate: dateCreate,
                dateEdit: dateEdit,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roomId,
                required String userId,
                required String content,
                required int version,
                required DateTime dateCreate,
                required DateTime dateEdit,
                Value<int> rowid = const Value.absent(),
              }) => RoomEventMessageCompanion.insert(
                id: id,
                roomId: roomId,
                userId: userId,
                content: content,
                version: version,
                dateCreate: dateCreate,
                dateEdit: dateEdit,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoomEventMessageTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roomId = false,
                userId = false,
                roomEventMessageAttachmentRefs = false,
                roomEventMessageReactionRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roomEventMessageAttachmentRefs)
                      db.roomEventMessageAttachment,
                    if (roomEventMessageReactionRefs)
                      db.roomEventMessageReaction,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (roomId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roomId,
                                    referencedTable:
                                        $$RoomEventMessageTableReferences
                                            ._roomIdTable(db),
                                    referencedColumn:
                                        $$RoomEventMessageTableReferences
                                            ._roomIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$RoomEventMessageTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$RoomEventMessageTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roomEventMessageAttachmentRefs)
                        await $_getPrefetchedData<
                          RoomEventMessageData,
                          $RoomEventMessageTable,
                          RoomEventMessageAttachmentData
                        >(
                          currentTable: table,
                          referencedTable: $$RoomEventMessageTableReferences
                              ._roomEventMessageAttachmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoomEventMessageTableReferences(
                                db,
                                table,
                                p0,
                              ).roomEventMessageAttachmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roomEventMessageId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (roomEventMessageReactionRefs)
                        await $_getPrefetchedData<
                          RoomEventMessageData,
                          $RoomEventMessageTable,
                          RoomEventMessageReactionData
                        >(
                          currentTable: table,
                          referencedTable: $$RoomEventMessageTableReferences
                              ._roomEventMessageReactionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoomEventMessageTableReferences(
                                db,
                                table,
                                p0,
                              ).roomEventMessageReactionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roomEventMessageId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoomEventMessageTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $RoomEventMessageTable,
      RoomEventMessageData,
      $$RoomEventMessageTableFilterComposer,
      $$RoomEventMessageTableOrderingComposer,
      $$RoomEventMessageTableAnnotationComposer,
      $$RoomEventMessageTableCreateCompanionBuilder,
      $$RoomEventMessageTableUpdateCompanionBuilder,
      (RoomEventMessageData, $$RoomEventMessageTableReferences),
      RoomEventMessageData,
      PrefetchHooks Function({
        bool roomId,
        bool userId,
        bool roomEventMessageAttachmentRefs,
        bool roomEventMessageReactionRefs,
      })
    >;
typedef $$RoomEventMessageAttachmentTableCreateCompanionBuilder =
    RoomEventMessageAttachmentCompanion Function({
      required String id,
      required String roomEventMessageId,
      required String chatAttachmentId,
      required String mimeType,
      required DateTime dateCreate,
      Value<int> rowid,
    });
typedef $$RoomEventMessageAttachmentTableUpdateCompanionBuilder =
    RoomEventMessageAttachmentCompanion Function({
      Value<String> id,
      Value<String> roomEventMessageId,
      Value<String> chatAttachmentId,
      Value<String> mimeType,
      Value<DateTime> dateCreate,
      Value<int> rowid,
    });

final class $$RoomEventMessageAttachmentTableReferences
    extends
        BaseReferences<
          _$ChatDatabase,
          $RoomEventMessageAttachmentTable,
          RoomEventMessageAttachmentData
        > {
  $$RoomEventMessageAttachmentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoomEventMessageTable _roomEventMessageIdTable(_$ChatDatabase db) =>
      db.roomEventMessage.createAlias(
        $_aliasNameGenerator(
          db.roomEventMessageAttachment.roomEventMessageId,
          db.roomEventMessage.id,
        ),
      );

  $$RoomEventMessageTableProcessedTableManager get roomEventMessageId {
    final $_column = $_itemColumn<String>('room_event_message_id')!;

    final manager = $$RoomEventMessageTableTableManager(
      $_db,
      $_db.roomEventMessage,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomEventMessageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoomEventMessageAttachmentTableFilterComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageAttachmentTable> {
  $$RoomEventMessageAttachmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chatAttachmentId => $composableBuilder(
    column: $table.chatAttachmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );

  $$RoomEventMessageTableFilterComposer get roomEventMessageId {
    final $$RoomEventMessageTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomEventMessageId,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableFilterComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageAttachmentTableOrderingComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageAttachmentTable> {
  $$RoomEventMessageAttachmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chatAttachmentId => $composableBuilder(
    column: $table.chatAttachmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoomEventMessageTableOrderingComposer get roomEventMessageId {
    final $$RoomEventMessageTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomEventMessageId,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableOrderingComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageAttachmentTableAnnotationComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageAttachmentTable> {
  $$RoomEventMessageAttachmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get chatAttachmentId => $composableBuilder(
    column: $table.chatAttachmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );

  $$RoomEventMessageTableAnnotationComposer get roomEventMessageId {
    final $$RoomEventMessageTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomEventMessageId,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableAnnotationComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageAttachmentTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $RoomEventMessageAttachmentTable,
          RoomEventMessageAttachmentData,
          $$RoomEventMessageAttachmentTableFilterComposer,
          $$RoomEventMessageAttachmentTableOrderingComposer,
          $$RoomEventMessageAttachmentTableAnnotationComposer,
          $$RoomEventMessageAttachmentTableCreateCompanionBuilder,
          $$RoomEventMessageAttachmentTableUpdateCompanionBuilder,
          (
            RoomEventMessageAttachmentData,
            $$RoomEventMessageAttachmentTableReferences,
          ),
          RoomEventMessageAttachmentData,
          PrefetchHooks Function({bool roomEventMessageId})
        > {
  $$RoomEventMessageAttachmentTableTableManager(
    _$ChatDatabase db,
    $RoomEventMessageAttachmentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomEventMessageAttachmentTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RoomEventMessageAttachmentTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RoomEventMessageAttachmentTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roomEventMessageId = const Value.absent(),
                Value<String> chatAttachmentId = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomEventMessageAttachmentCompanion(
                id: id,
                roomEventMessageId: roomEventMessageId,
                chatAttachmentId: chatAttachmentId,
                mimeType: mimeType,
                dateCreate: dateCreate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roomEventMessageId,
                required String chatAttachmentId,
                required String mimeType,
                required DateTime dateCreate,
                Value<int> rowid = const Value.absent(),
              }) => RoomEventMessageAttachmentCompanion.insert(
                id: id,
                roomEventMessageId: roomEventMessageId,
                chatAttachmentId: chatAttachmentId,
                mimeType: mimeType,
                dateCreate: dateCreate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoomEventMessageAttachmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roomEventMessageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roomEventMessageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roomEventMessageId,
                                referencedTable:
                                    $$RoomEventMessageAttachmentTableReferences
                                        ._roomEventMessageIdTable(db),
                                referencedColumn:
                                    $$RoomEventMessageAttachmentTableReferences
                                        ._roomEventMessageIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoomEventMessageAttachmentTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $RoomEventMessageAttachmentTable,
      RoomEventMessageAttachmentData,
      $$RoomEventMessageAttachmentTableFilterComposer,
      $$RoomEventMessageAttachmentTableOrderingComposer,
      $$RoomEventMessageAttachmentTableAnnotationComposer,
      $$RoomEventMessageAttachmentTableCreateCompanionBuilder,
      $$RoomEventMessageAttachmentTableUpdateCompanionBuilder,
      (
        RoomEventMessageAttachmentData,
        $$RoomEventMessageAttachmentTableReferences,
      ),
      RoomEventMessageAttachmentData,
      PrefetchHooks Function({bool roomEventMessageId})
    >;
typedef $$RoomEventMessageReactionTableCreateCompanionBuilder =
    RoomEventMessageReactionCompanion Function({
      required String id,
      required String roomEventMessageId,
      required String userId,
      required String content,
      required DateTime dateCreate,
      Value<int> rowid,
    });
typedef $$RoomEventMessageReactionTableUpdateCompanionBuilder =
    RoomEventMessageReactionCompanion Function({
      Value<String> id,
      Value<String> roomEventMessageId,
      Value<String> userId,
      Value<String> content,
      Value<DateTime> dateCreate,
      Value<int> rowid,
    });

final class $$RoomEventMessageReactionTableReferences
    extends
        BaseReferences<
          _$ChatDatabase,
          $RoomEventMessageReactionTable,
          RoomEventMessageReactionData
        > {
  $$RoomEventMessageReactionTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoomEventMessageTable _roomEventMessageIdTable(_$ChatDatabase db) =>
      db.roomEventMessage.createAlias(
        $_aliasNameGenerator(
          db.roomEventMessageReaction.roomEventMessageId,
          db.roomEventMessage.id,
        ),
      );

  $$RoomEventMessageTableProcessedTableManager get roomEventMessageId {
    final $_column = $_itemColumn<String>('room_event_message_id')!;

    final manager = $$RoomEventMessageTableTableManager(
      $_db,
      $_db.roomEventMessage,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomEventMessageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserTable _userIdTable(_$ChatDatabase db) => db.user.createAlias(
    $_aliasNameGenerator(db.roomEventMessageReaction.userId, db.user.id),
  );

  $$UserTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoomEventMessageReactionTableFilterComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageReactionTable> {
  $$RoomEventMessageReactionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );

  $$RoomEventMessageTableFilterComposer get roomEventMessageId {
    final $$RoomEventMessageTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomEventMessageId,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableFilterComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableFilterComposer get userId {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageReactionTableOrderingComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageReactionTable> {
  $$RoomEventMessageReactionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoomEventMessageTableOrderingComposer get roomEventMessageId {
    final $$RoomEventMessageTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomEventMessageId,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableOrderingComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableOrderingComposer get userId {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageReactionTableAnnotationComposer
    extends Composer<_$ChatDatabase, $RoomEventMessageReactionTable> {
  $$RoomEventMessageReactionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );

  $$RoomEventMessageTableAnnotationComposer get roomEventMessageId {
    final $$RoomEventMessageTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomEventMessageId,
      referencedTable: $db.roomEventMessage,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomEventMessageTableAnnotationComposer(
            $db: $db,
            $table: $db.roomEventMessage,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableAnnotationComposer get userId {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomEventMessageReactionTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $RoomEventMessageReactionTable,
          RoomEventMessageReactionData,
          $$RoomEventMessageReactionTableFilterComposer,
          $$RoomEventMessageReactionTableOrderingComposer,
          $$RoomEventMessageReactionTableAnnotationComposer,
          $$RoomEventMessageReactionTableCreateCompanionBuilder,
          $$RoomEventMessageReactionTableUpdateCompanionBuilder,
          (
            RoomEventMessageReactionData,
            $$RoomEventMessageReactionTableReferences,
          ),
          RoomEventMessageReactionData,
          PrefetchHooks Function({bool roomEventMessageId, bool userId})
        > {
  $$RoomEventMessageReactionTableTableManager(
    _$ChatDatabase db,
    $RoomEventMessageReactionTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomEventMessageReactionTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RoomEventMessageReactionTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RoomEventMessageReactionTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roomEventMessageId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomEventMessageReactionCompanion(
                id: id,
                roomEventMessageId: roomEventMessageId,
                userId: userId,
                content: content,
                dateCreate: dateCreate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roomEventMessageId,
                required String userId,
                required String content,
                required DateTime dateCreate,
                Value<int> rowid = const Value.absent(),
              }) => RoomEventMessageReactionCompanion.insert(
                id: id,
                roomEventMessageId: roomEventMessageId,
                userId: userId,
                content: content,
                dateCreate: dateCreate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoomEventMessageReactionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roomEventMessageId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roomEventMessageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roomEventMessageId,
                                referencedTable:
                                    $$RoomEventMessageReactionTableReferences
                                        ._roomEventMessageIdTable(db),
                                referencedColumn:
                                    $$RoomEventMessageReactionTableReferences
                                        ._roomEventMessageIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$RoomEventMessageReactionTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$RoomEventMessageReactionTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoomEventMessageReactionTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $RoomEventMessageReactionTable,
      RoomEventMessageReactionData,
      $$RoomEventMessageReactionTableFilterComposer,
      $$RoomEventMessageReactionTableOrderingComposer,
      $$RoomEventMessageReactionTableAnnotationComposer,
      $$RoomEventMessageReactionTableCreateCompanionBuilder,
      $$RoomEventMessageReactionTableUpdateCompanionBuilder,
      (RoomEventMessageReactionData, $$RoomEventMessageReactionTableReferences),
      RoomEventMessageReactionData,
      PrefetchHooks Function({bool roomEventMessageId, bool userId})
    >;
typedef $$RoomEventSystemTableCreateCompanionBuilder =
    RoomEventSystemCompanion Function({
      required String id,
      required String roomId,
      required int version,
      required String content,
      required DateTime dateCreate,
      Value<int> rowid,
    });
typedef $$RoomEventSystemTableUpdateCompanionBuilder =
    RoomEventSystemCompanion Function({
      Value<String> id,
      Value<String> roomId,
      Value<int> version,
      Value<String> content,
      Value<DateTime> dateCreate,
      Value<int> rowid,
    });

class $$RoomEventSystemTableFilterComposer
    extends Composer<_$ChatDatabase, $RoomEventSystemTable> {
  $$RoomEventSystemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoomEventSystemTableOrderingComposer
    extends Composer<_$ChatDatabase, $RoomEventSystemTable> {
  $$RoomEventSystemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomEventSystemTableAnnotationComposer
    extends Composer<_$ChatDatabase, $RoomEventSystemTable> {
  $$RoomEventSystemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );
}

class $$RoomEventSystemTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $RoomEventSystemTable,
          RoomEventSystemData,
          $$RoomEventSystemTableFilterComposer,
          $$RoomEventSystemTableOrderingComposer,
          $$RoomEventSystemTableAnnotationComposer,
          $$RoomEventSystemTableCreateCompanionBuilder,
          $$RoomEventSystemTableUpdateCompanionBuilder,
          (
            RoomEventSystemData,
            BaseReferences<
              _$ChatDatabase,
              $RoomEventSystemTable,
              RoomEventSystemData
            >,
          ),
          RoomEventSystemData,
          PrefetchHooks Function()
        > {
  $$RoomEventSystemTableTableManager(
    _$ChatDatabase db,
    $RoomEventSystemTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomEventSystemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomEventSystemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomEventSystemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roomId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomEventSystemCompanion(
                id: id,
                roomId: roomId,
                version: version,
                content: content,
                dateCreate: dateCreate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roomId,
                required int version,
                required String content,
                required DateTime dateCreate,
                Value<int> rowid = const Value.absent(),
              }) => RoomEventSystemCompanion.insert(
                id: id,
                roomId: roomId,
                version: version,
                content: content,
                dateCreate: dateCreate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoomEventSystemTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $RoomEventSystemTable,
      RoomEventSystemData,
      $$RoomEventSystemTableFilterComposer,
      $$RoomEventSystemTableOrderingComposer,
      $$RoomEventSystemTableAnnotationComposer,
      $$RoomEventSystemTableCreateCompanionBuilder,
      $$RoomEventSystemTableUpdateCompanionBuilder,
      (
        RoomEventSystemData,
        BaseReferences<
          _$ChatDatabase,
          $RoomEventSystemTable,
          RoomEventSystemData
        >,
      ),
      RoomEventSystemData,
      PrefetchHooks Function()
    >;
typedef $$RoomMemberTableCreateCompanionBuilder =
    RoomMemberCompanion Function({
      required String roomId,
      required String userId,
      required MemberStatus memberStatus,
      required int permission,
      Value<DateTime?> lastReadMarker,
      required DateTime dateCreate,
      Value<DateTime?> dateUpdate,
      Value<int> rowid,
    });
typedef $$RoomMemberTableUpdateCompanionBuilder =
    RoomMemberCompanion Function({
      Value<String> roomId,
      Value<String> userId,
      Value<MemberStatus> memberStatus,
      Value<int> permission,
      Value<DateTime?> lastReadMarker,
      Value<DateTime> dateCreate,
      Value<DateTime?> dateUpdate,
      Value<int> rowid,
    });

final class $$RoomMemberTableReferences
    extends BaseReferences<_$ChatDatabase, $RoomMemberTable, RoomMemberData> {
  $$RoomMemberTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoomTable _roomIdTable(_$ChatDatabase db) => db.room.createAlias(
    $_aliasNameGenerator(db.roomMember.roomId, db.room.id),
  );

  $$RoomTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<String>('room_id')!;

    final manager = $$RoomTableTableManager(
      $_db,
      $_db.room,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UserTable _userIdTable(_$ChatDatabase db) => db.user.createAlias(
    $_aliasNameGenerator(db.roomMember.userId, db.user.id),
  );

  $$UserTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RoomMemberTableFilterComposer
    extends Composer<_$ChatDatabase, $RoomMemberTable> {
  $$RoomMemberTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<MemberStatus, MemberStatus, int>
  get memberStatus => $composableBuilder(
    column: $table.memberStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get permission => $composableBuilder(
    column: $table.permission,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReadMarker => $composableBuilder(
    column: $table.lastReadMarker,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => ColumnFilters(column),
  );

  $$RoomTableFilterComposer get roomId {
    final $$RoomTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.room,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomTableFilterComposer(
            $db: $db,
            $table: $db.room,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableFilterComposer get userId {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomMemberTableOrderingComposer
    extends Composer<_$ChatDatabase, $RoomMemberTable> {
  $$RoomMemberTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get memberStatus => $composableBuilder(
    column: $table.memberStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get permission => $composableBuilder(
    column: $table.permission,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReadMarker => $composableBuilder(
    column: $table.lastReadMarker,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoomTableOrderingComposer get roomId {
    final $$RoomTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.room,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomTableOrderingComposer(
            $db: $db,
            $table: $db.room,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableOrderingComposer get userId {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomMemberTableAnnotationComposer
    extends Composer<_$ChatDatabase, $RoomMemberTable> {
  $$RoomMemberTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<MemberStatus, int> get memberStatus =>
      $composableBuilder(
        column: $table.memberStatus,
        builder: (column) => column,
      );

  GeneratedColumn<int> get permission => $composableBuilder(
    column: $table.permission,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReadMarker => $composableBuilder(
    column: $table.lastReadMarker,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateCreate => $composableBuilder(
    column: $table.dateCreate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateUpdate => $composableBuilder(
    column: $table.dateUpdate,
    builder: (column) => column,
  );

  $$RoomTableAnnotationComposer get roomId {
    final $$RoomTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.room,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomTableAnnotationComposer(
            $db: $db,
            $table: $db.room,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UserTableAnnotationComposer get userId {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomMemberTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $RoomMemberTable,
          RoomMemberData,
          $$RoomMemberTableFilterComposer,
          $$RoomMemberTableOrderingComposer,
          $$RoomMemberTableAnnotationComposer,
          $$RoomMemberTableCreateCompanionBuilder,
          $$RoomMemberTableUpdateCompanionBuilder,
          (RoomMemberData, $$RoomMemberTableReferences),
          RoomMemberData,
          PrefetchHooks Function({bool roomId, bool userId})
        > {
  $$RoomMemberTableTableManager(_$ChatDatabase db, $RoomMemberTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomMemberTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomMemberTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomMemberTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> roomId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<MemberStatus> memberStatus = const Value.absent(),
                Value<int> permission = const Value.absent(),
                Value<DateTime?> lastReadMarker = const Value.absent(),
                Value<DateTime> dateCreate = const Value.absent(),
                Value<DateTime?> dateUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomMemberCompanion(
                roomId: roomId,
                userId: userId,
                memberStatus: memberStatus,
                permission: permission,
                lastReadMarker: lastReadMarker,
                dateCreate: dateCreate,
                dateUpdate: dateUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String roomId,
                required String userId,
                required MemberStatus memberStatus,
                required int permission,
                Value<DateTime?> lastReadMarker = const Value.absent(),
                required DateTime dateCreate,
                Value<DateTime?> dateUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomMemberCompanion.insert(
                roomId: roomId,
                userId: userId,
                memberStatus: memberStatus,
                permission: permission,
                lastReadMarker: lastReadMarker,
                dateCreate: dateCreate,
                dateUpdate: dateUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoomMemberTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roomId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roomId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roomId,
                                referencedTable: $$RoomMemberTableReferences
                                    ._roomIdTable(db),
                                referencedColumn: $$RoomMemberTableReferences
                                    ._roomIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$RoomMemberTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$RoomMemberTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoomMemberTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $RoomMemberTable,
      RoomMemberData,
      $$RoomMemberTableFilterComposer,
      $$RoomMemberTableOrderingComposer,
      $$RoomMemberTableAnnotationComposer,
      $$RoomMemberTableCreateCompanionBuilder,
      $$RoomMemberTableUpdateCompanionBuilder,
      (RoomMemberData, $$RoomMemberTableReferences),
      RoomMemberData,
      PrefetchHooks Function({bool roomId, bool userId})
    >;
typedef $$UserPushTableCreateCompanionBuilder =
    UserPushCompanion Function({
      required String id,
      required String userId,
      required String deviceName,
      required String token,
      Value<int> rowid,
    });
typedef $$UserPushTableUpdateCompanionBuilder =
    UserPushCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> deviceName,
      Value<String> token,
      Value<int> rowid,
    });

final class $$UserPushTableReferences
    extends BaseReferences<_$ChatDatabase, $UserPushTable, UserPushData> {
  $$UserPushTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _userIdTable(_$ChatDatabase db) =>
      db.user.createAlias($_aliasNameGenerator(db.userPush.userId, db.user.id));

  $$UserTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserPushTableFilterComposer
    extends Composer<_$ChatDatabase, $UserPushTable> {
  $$UserPushTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableFilterComposer get userId {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserPushTableOrderingComposer
    extends Composer<_$ChatDatabase, $UserPushTable> {
  $$UserPushTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableOrderingComposer get userId {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserPushTableAnnotationComposer
    extends Composer<_$ChatDatabase, $UserPushTable> {
  $$UserPushTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  $$UserTableAnnotationComposer get userId {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserPushTableTableManager
    extends
        RootTableManager<
          _$ChatDatabase,
          $UserPushTable,
          UserPushData,
          $$UserPushTableFilterComposer,
          $$UserPushTableOrderingComposer,
          $$UserPushTableAnnotationComposer,
          $$UserPushTableCreateCompanionBuilder,
          $$UserPushTableUpdateCompanionBuilder,
          (UserPushData, $$UserPushTableReferences),
          UserPushData,
          PrefetchHooks Function({bool userId})
        > {
  $$UserPushTableTableManager(_$ChatDatabase db, $UserPushTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserPushTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserPushTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserPushTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> deviceName = const Value.absent(),
                Value<String> token = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserPushCompanion(
                id: id,
                userId: userId,
                deviceName: deviceName,
                token: token,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String deviceName,
                required String token,
                Value<int> rowid = const Value.absent(),
              }) => UserPushCompanion.insert(
                id: id,
                userId: userId,
                deviceName: deviceName,
                token: token,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserPushTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$UserPushTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$UserPushTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserPushTableProcessedTableManager =
    ProcessedTableManager<
      _$ChatDatabase,
      $UserPushTable,
      UserPushData,
      $$UserPushTableFilterComposer,
      $$UserPushTableOrderingComposer,
      $$UserPushTableAnnotationComposer,
      $$UserPushTableCreateCompanionBuilder,
      $$UserPushTableUpdateCompanionBuilder,
      (UserPushData, $$UserPushTableReferences),
      UserPushData,
      PrefetchHooks Function({bool userId})
    >;

class $ChatDatabaseManager {
  final _$ChatDatabase _db;
  $ChatDatabaseManager(this._db);
  $$RoomTableTableManager get room => $$RoomTableTableManager(_db, _db.room);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$RoomEventMessageTableTableManager get roomEventMessage =>
      $$RoomEventMessageTableTableManager(_db, _db.roomEventMessage);
  $$RoomEventMessageAttachmentTableTableManager
  get roomEventMessageAttachment =>
      $$RoomEventMessageAttachmentTableTableManager(
        _db,
        _db.roomEventMessageAttachment,
      );
  $$RoomEventMessageReactionTableTableManager get roomEventMessageReaction =>
      $$RoomEventMessageReactionTableTableManager(
        _db,
        _db.roomEventMessageReaction,
      );
  $$RoomEventSystemTableTableManager get roomEventSystem =>
      $$RoomEventSystemTableTableManager(_db, _db.roomEventSystem);
  $$RoomMemberTableTableManager get roomMember =>
      $$RoomMemberTableTableManager(_db, _db.roomMember);
  $$UserPushTableTableManager get userPush =>
      $$UserPushTableTableManager(_db, _db.userPush);
}
