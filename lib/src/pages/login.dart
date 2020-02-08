import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/models/user-model.dart';
import 'package:together_admin/src/util/globals.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF231F20),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            SizedBox(width: 50),
            Image.asset(
              '/images/logo.png',
              width: 400,
              height: 125,
            ),
          ]),
          SizedBox(height: 200),
          Center(
            child: FlatButton(
                color: Color(0x00000000),
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
                  Globals.users = users;
                  Navigator.pushReplacementNamed(context, '/user');
                },
                child: Text(
                  'ВОЙТИ',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
