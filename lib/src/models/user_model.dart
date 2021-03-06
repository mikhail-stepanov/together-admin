/// id : 5
/// userId : 2459
/// name : "Inozemtsev max"
/// email : "danser554@gmail.com"
/// phone : "+79163764455"
/// facebook : "-"
/// instagram : "-"
/// picId : 0
/// verified : true

class User {
  int _id;
  int _userId;
  String _firstName;
  String _lastName;
  String _email;
  String _phone;
  String _facebook;
  String _instagram;
  int _picId;
  bool _verified;

  int get id => _id;

  int get userId => _userId;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get phone => _phone;

  String get facebook => _facebook;

  String get instagram => _instagram;

  int get picId => _picId;

  bool get verified => _verified;

  User(
      this._id,
      this._userId,
      this._firstName,
      this._lastName,
      this._email,
      this._phone,
      this._facebook,
      this._instagram,
      this._picId,
      this._verified);

  User.map(dynamic obj) {
    this._id = obj["id"];
    this._userId = obj["userId"];
    this._firstName = obj["firstName"];
    this._lastName = obj["lastName"];
    this._email = obj["email"];
    this._phone = obj["phone"];
    this._facebook = obj["facebook"];
    this._instagram = obj["instagram"];
    this._picId = obj["picId"];
    this._verified = obj["verified"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["userId"] = _userId;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["email"] = _email;
    map["phone"] = _phone;
    map["facebook"] = _facebook;
    map["instagram"] = _instagram;
    map["picId"] = _picId;
    map["verified"] = _verified;
    return map;
  }
}
