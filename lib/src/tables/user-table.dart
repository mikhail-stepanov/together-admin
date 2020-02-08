import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/models/user-model.dart';
import 'package:together_admin/src/util/globals.dart';

class UserTable extends StatefulWidget {
  UserTable() : super();

  @override
  UserTableState createState() => UserTableState();
}

class UserTableState extends State<UserTable> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;

  @override
  void initState() {
    super.initState();
    sort = false;
    selectedUsers = [];
    users = Globals.users;
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
              label: Text("Имя и фамилия"),
              numeric: false,
              tooltip: "Имя и фамилия",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSort(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("id"),
            numeric: true,
            tooltip: "id",
          ),
          DataColumn(
            label: Text("Email"),
            numeric: false,
            tooltip: "Email",
          ),
          DataColumn(
            label: Text("Телефон"),
            numeric: false,
            tooltip: "Телефон",
          ),
          DataColumn(
            label: Text("Facebook"),
            numeric: false,
            tooltip: "Facebook",
          ),
          DataColumn(
            label: Text("Instagram"),
            numeric: false,
            tooltip: "Instagram",
          ),
          DataColumn(
            label: Text("Подтвержден"),
            numeric: false,
            tooltip: "Подтвержден",
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
                  child: Text('Все пользователи'),
                  onPressed: () async {
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
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Подтвержденные'),
                  onPressed: () async {
                    var url =
                        'http://84.201.185.226:8080/v1/user/list/verified';
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
                    this.users = users;
                    setState(() {
                      this.users = users;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Неподтвержденные'),
                  onPressed: () async {
                    var url =
                        'http://84.201.185.226:8080/v1/user/list/unverified';
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
                    this.users = users;
                    setState(() {
                      this.users = users;
                    });
                  },
                ),
              ),
              SizedBox(width: 300),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Удалить'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Подтвердить ${selectedUsers.length}'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          verifySelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//class User {
//  String firstName;
//  String lastName;
//
//  User({this.firstName, this.lastName});
//
//  static List<User> getUsers() {
//    return <User>[
//      User(firstName: "Java", lastName: "James Gosling"),
//      User(firstName: "Android", lastName: "-"),
//      User(firstName: "Flutter", lastName: "-"),
//      User(firstName: "PHP", lastName: "Rasmus Lerdorf"),
//      User(firstName: "C", lastName: "Dennis Ritchie"),
//      User(firstName: "C++", lastName: "Bjarne Stroustrup")
//    ];
//  }
//}
