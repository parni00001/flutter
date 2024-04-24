class NewsBean {
  int? _code;
  String? _message;
  Data? _data;
  int? _timeStamp;

  NewsBean({int? code, String? message, Data? data, int? timeStamp}) {
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

  NewsBean.fromJson(Map<String, dynamic> json) {
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
  List<Items>? _items;
  int? _total;
  Null? _extra;

  Data({List<Items>? items, int? total, Null? extra}) {
    if (items != null) {
      this._items = items;
    }
    if (total != null) {
      this._total = total;
    }
    if (extra != null) {
      this._extra = extra;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;
  int? get total => _total;
  set total(int? total) => _total = total;
  Null? get extra => _extra;
  set extra(Null? extra) => _extra = extra;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
    _total = json['total'];
    _extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._items != null) {
      data['items'] = this._items!.map((v) => v.toJson()).toList();
    }
    data['total'] = this._total;
    data['extra'] = this._extra;
    return data;
  }
}

class Items {
  int? _id;
  String? _locale;
  int? _type;
  String? _title;
  String? _thumbnail;
  String? _video;
  String? _content;
  int? _sort;
  String? _createdAt;
  String? _updatedAt;

  Items(
      {int? id,
        String? locale,
        int? type,
        String? title,
        String? thumbnail,
        String? video,
        String? content,
        int? sort,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (locale != null) {
      this._locale = locale;
    }
    if (type != null) {
      this._type = type;
    }
    if (title != null) {
      this._title = title;
    }
    if (thumbnail != null) {
      this._thumbnail = thumbnail;
    }
    if (video != null) {
      this._video = video;
    }
    if (content != null) {
      this._content = content;
    }
    if (sort != null) {
      this._sort = sort;
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
  String? get locale => _locale;
  set locale(String? locale) => _locale = locale;
  int? get type => _type;
  set type(int? type) => _type = type;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;
  String? get video => _video;
  set video(String? video) => _video = video;
  String? get content => _content;
  set content(String? content) => _content = content;
  int? get sort => _sort;
  set sort(int? sort) => _sort = sort;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Items.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _locale = json['locale'];
    _type = json['type'];
    _title = json['title'];
    _thumbnail = json['thumbnail'];
    _video = json['video'];
    _content = json['content'];
    _sort = json['sort'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['locale'] = this._locale;
    data['type'] = this._type;
    data['title'] = this._title;
    data['thumbnail'] = this._thumbnail;
    data['video'] = this._video;
    data['content'] = this._content;
    data['sort'] = this._sort;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
