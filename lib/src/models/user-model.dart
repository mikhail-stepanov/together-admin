/// id : 5
/// userId : 2459
/// name : "Inozemtsev max"
/// email : "danser554@gmail.com"
/// phone : "+79163764455"
/// facebook : ""
/// instagram : ""
/// picUrl : null
/// verified : true

class User {
  int _id;
  int _userId;
  String _name;
  String _email;
  String _phone;
  String _facebook;
  String _instagram;
  String _picUrl;
  bool _verified;

  int get id => _id;
  int get userId => _userId;
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get facebook => _facebook;
  String get instagram => _instagram;
  String get picUrl => _picUrl;
  bool get verified => _verified;

  User(this._id, this._userId, this._name, this._email, this._phone, this._facebook, this._instagram, this._picUrl, this._verified);

  User.map(dynamic obj) {
    this._id = obj["id"];
    this._userId = obj["userId"];
    this._name = obj["name"];
    this._email = obj["email"];
    this._phone = obj["phone"];
    this._facebook = obj["facebook"];
    this._instagram = obj["instagram"];
    this._picUrl = obj["picUrl"];
    this._verified = obj["verified"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["userId"] = _userId;
    map["name"] = _name;
    map["email"] = _email;
    map["phone"] = _phone;
    map["facebook"] = _facebook;
    map["instagram"] = _instagram;
    map["picUrl"] = _picUrl;
    map["verified"] = _verified;
    return map;
  }

}