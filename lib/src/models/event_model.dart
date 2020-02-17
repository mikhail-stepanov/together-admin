/// id : 1
/// title : "TOGETHER NEW YEAR (21+)"
/// place : "Ресторан Центрального Дома Литераторов. Москва ул. Поварская 50/53 стр. 1"
/// date : "01.01.20 01:00-10:00"
/// ticketcloud : "-"
/// picBigUrl : "-"
/// picSmallUrl : "-"
/// video : "-"
/// description : "Новый год с командой TOGETHER"
/// youtube : "-"
/// soundcloud : "-"
/// cloud : "-"
/// future : false

class Event {
  int _id;
  String _title;
  String _place;
  String _date;
  String _ticketcloud;
  String _picBig;
  String _picSmall;
  String _video;
  String _description;
  String _youtube;
  String _soundcloud;
  String _cloud;
  bool _future;

  int get id => _id;
  String get title => _title;
  String get place => _place;
  String get date => _date;
  String get ticketcloud => _ticketcloud;
  String get picBig => _picBig;
  String get picSmall => _picSmall;
  String get video => _video;
  String get description => _description;
  String get youtube => _youtube;
  String get soundcloud => _soundcloud;
  String get cloud => _cloud;
  bool get future => _future;

  Event(this._id, this._title, this._place, this._date, this._ticketcloud, this._picBig, this._picSmall, this._video, this._description, this._youtube, this._soundcloud, this._cloud, this._future);

  Event.map(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._place = obj["place"];
    this._date = obj["date"];
    this._ticketcloud = obj["ticketcloud"];
    this._picBig = obj["picBig"];
    this._picSmall = obj["picSmall"];
    this._video = obj["video"];
    this._description = obj["description"];
    this._youtube = obj["youtube"];
    this._soundcloud = obj["soundcloud"];
    this._cloud = obj["cloud"];
    this._future = obj["future"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["title"] = _title;
    map["place"] = _place;
    map["date"] = _date;
    map["ticketcloud"] = _ticketcloud;
    map["picBig"] = _picBig;
    map["picSmall"] = _picSmall;
    map["video"] = _video;
    map["description"] = _description;
    map["youtube"] = _youtube;
    map["soundcloud"] = _soundcloud;
    map["cloud"] = _cloud;
    map["future"] = _future;
    return map;
  }

}