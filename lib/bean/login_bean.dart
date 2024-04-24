class LoginBean {
  int? _code;
  String? _message;
  Data? _data;
  int? _timeStamp;

  LoginBean({int? code, String? message, Data? data, int? timeStamp}) {
    if (code != null) {
      this._code = code;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
    if (timeStamp != null) {
      this._timeStamp = timeStamp;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  int? get timeStamp => _timeStamp;
  set timeStamp(int? timeStamp) => _timeStamp = timeStamp;

  LoginBean.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['timeStamp'] = this._timeStamp;
    return data;
  }
}

class Data {
  String? _token;
  User? _user;

  Data({String? token, User? user}) {
    if (token != null) {
      this._token = token;
    }
    if (user != null) {
      this._user = user;
    }
  }

  String? get token => _token;
  set token(String? token) => _token = token;
  User? get user => _user;
  set user(User? user) => _user = user;

  Data.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  String? _nickname;
  String? _username;
  String? _role;
  int? _roleId;
  bool? _twoAuthKey;
  bool? _chatId;
  int? _isLock;
  String? _lastIp;
  String? _lastTime;
  List<String>? _permissions;
  String? _homePath;
  String? _createdAt;
  String? _updatedAt;

  User(
      {int? id,
        String? nickname,
        String? username,
        String? role,
        int? roleId,
        bool? twoAuthKey,
        bool? chatId,
        int? isLock,
        String? lastIp,
        String? lastTime,
        List<String>? permissions,
        String? homePath,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (nickname != null) {
      this._nickname = nickname;
    }
    if (username != null) {
      this._username = username;
    }
    if (role != null) {
      this._role = role;
    }
    if (roleId != null) {
      this._roleId = roleId;
    }
    if (twoAuthKey != null) {
      this._twoAuthKey = twoAuthKey;
    }
    if (chatId != null) {
      this._chatId = chatId;
    }
    if (isLock != null) {
      this._isLock = isLock;
    }
    if (lastIp != null) {
      this._lastIp = lastIp;
    }
    if (lastTime != null) {
      this._lastTime = lastTime;
    }
    if (permissions != null) {
      this._permissions = permissions;
    }
    if (homePath != null) {
      this._homePath = homePath;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get nickname => _nickname;
  set nickname(String? nickname) => _nickname = nickname;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get role => _role;
  set role(String? role) => _role = role;
  int? get roleId => _roleId;
  set roleId(int? roleId) => _roleId = roleId;
  bool? get twoAuthKey => _twoAuthKey;
  set twoAuthKey(bool? twoAuthKey) => _twoAuthKey = twoAuthKey;
  bool? get chatId => _chatId;
  set chatId(bool? chatId) => _chatId = chatId;
  int? get isLock => _isLock;
  set isLock(int? isLock) => _isLock = isLock;
  String? get lastIp => _lastIp;
  set lastIp(String? lastIp) => _lastIp = lastIp;
  String? get lastTime => _lastTime;
  set lastTime(String? lastTime) => _lastTime = lastTime;
  List<String>? get permissions => _permissions;
  set permissions(List<String>? permissions) => _permissions = permissions;
  String? get homePath => _homePath;
  set homePath(String? homePath) => _homePath = homePath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nickname = json['nickname'];
    _username = json['username'];
    _role = json['role'];
    _roleId = json['role_id'];
    _twoAuthKey = json['two_auth_key'];
    _chatId = json['chat_id'];
    _isLock = json['is_lock'];
    _lastIp = json['last_ip'];
    _lastTime = json['last_time'];
    _permissions = json['permissions'].cast<String>();
    _homePath = json['home_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nickname'] = this._nickname;
    data['username'] = this._username;
    data['role'] = this._role;
    data['role_id'] = this._roleId;
    data['two_auth_key'] = this._twoAuthKey;
    data['chat_id'] = this._chatId;
    data['is_lock'] = this._isLock;
    data['last_ip'] = this._lastIp;
    data['last_time'] = this._lastTime;
    data['permissions'] = this._permissions;
    data['home_path'] = this._homePath;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

