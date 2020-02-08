import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/models/user-model.dart';

class EventTable extends StatefulWidget {
  EventTable() : super();

  @override
  EventTableState createState() => EventTableState();
}

class EventTableState extends State<EventTable> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;

  @override
  void initState() {
    super.initState();
    sort = false;
    selectedUsers = [];
    users = [];
  }

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.name.compareTo(b.name));
      } else {
        users.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    if (selectedUsers.isNotEmpty) {
      List<User> temp = [];
      temp.addAll(selectedUsers);
      for (User user in temp) {
        var url = 'http://84.201.185.226:8080/v1/user/remove';
        var response = await http.post(url,
            headers: {
              'Content-Type': 'application/json; charset=utf-8',
              'Accept': 'application/json; charset=utf-8'
            },
            body: jsonEncode({
              'userId': user.userId,
            }));
      }
    }
    var url = 'http://84.201.185.226:8080/v1/user/list';
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8'
    });

    var users = List<User>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        users.add(User.map(noteJson));
      }
    }
    setState(() {
      this.users = users;
    });
  }

  verifySelected() async {
    if (selectedUsers.isNotEmpty) {
      List<User> temp = [];
      temp.addAll(selectedUsers);
      for (User user in temp) {
        var url = 'http://84.201.185.226:8080/v1/user/verify';
        var response = await http.post(url,
            headers: {
              'Content-Type': 'application/json; charset=utf-8',
              'Accept': 'application/json; charset=utf-8'
            },
            body: jsonEncode({
              'userId': user.userId,
            }));
      }
    }
    var url = 'http://84.201.185.226:8080/v1/user/list';
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8'
    });

    var users = List<User>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        users.add(User.map(noteJson));
      }
    }
    setState(() {
      this.users = users;
      this.selectedUsers = [];
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("Название"),
              numeric: false,
              tooltip: "Название",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSort(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("Место"),
            numeric: true,
            tooltip: "Место",
          ),
          DataColumn(
            label: Text("Дата"),
            numeric: false,
            tooltip: "Дата",
          ),
          DataColumn(
            label: Text("Описание"),
            numeric: false,
            tooltip: "Описание",
          ),
          DataColumn(
            label: Text("Ticketcloud"),
            numeric: false,
            tooltip: "Ticketcloud",
          ),
          DataColumn(
            label: Text("Изображение"),
            numeric: false,
            tooltip: "Изображение",
          ),
          DataColumn(
            label: Text("Видео"),
            numeric: false,
            tooltip: "Видео",
          ),
        ],
        rows: users
            .map((user) => DataRow(
                    selected: selectedUsers.contains(user),
                    onSelectChanged: (b) {
                      print("Onselect");
                      onSelectedRow(b, user);
                    },
                    cells: [
                      DataCell(
                        Text(user.name),
                        onTap: () {
                          print('Selected ${user.name}');
                        },
                      ),
                      DataCell(
                        Text(user.userId.toString()),
                      ),
                      DataCell(
                        Text(user.email),
                      ),
                      DataCell(
                        Text(user.phone),
                      ),
                      DataCell(
                        Text(user.facebook),
                      ),
                      DataCell(
                        Text(user.instagram),
                      ),
                      DataCell(
                        Text(user.verified.toString()),
                      ),
                    ]))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Все мероприятия'),
                  onPressed: () async {
//                    var url = 'http://84.201.185.226:8080/v1/user/list';
//                    var response = await http.get(url, headers: {
//                      'Content-Type': 'application/json; charset=utf-8',
//                      'Accept': 'application/json; charset=utf-8'
//                    });
//
//                    var users = List<User>();
//
//                    if (response.statusCode == 200) {
//                      var notesJson = json.decode(response.body);
//                      for (var noteJson in notesJson) {
//                        users.add(User.map(noteJson));
//                      }
//                    }
//                    setState(() {
//                      this.users = users;
//                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Будущие'),
                  onPressed: () async {
//                    var url =
//                        'http://84.201.185.226:8080/v1/user/list/verified';
//                    var response = await http.get(url, headers: {
//                      'Content-Type': 'application/json; charset=utf-8',
//                      'Accept': 'application/json; charset=utf-8'
//                    });
//
//                    var users = List<User>();
//
//                    if (response.statusCode == 200) {
//                      var notesJson = json.decode(response.body);
//                      for (var noteJson in notesJson) {
//                        users.add(User.map(noteJson));
//                      }
//                    }
//                    this.users = users;
//                    setState(() {
//                      this.users = users;
//                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Прошедшие'),
                  onPressed: () async {
//                    var url =
//                        'http://84.201.185.226:8080/v1/user/list/unverified';
//                    var response = await http.get(url, headers: {
//                      'Content-Type': 'application/json; charset=utf-8',
//                      'Accept': 'application/json; charset=utf-8'
//                    });
//
//                    var users = List<User>();
//
//                    if (response.statusCode == 200) {
//                      var notesJson = json.decode(response.body);
//                      for (var noteJson in notesJson) {
//                        users.add(User.map(noteJson));
//                      }
//                    }
//                    this.users = users;
//                    setState(() {
//                      this.users = users;
//                    });
                  },
                ),
              ),
              SizedBox(width: 280),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Удалить'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Редактировать'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Добавить новоe'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

