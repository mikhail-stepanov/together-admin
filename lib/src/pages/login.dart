import 'dart:convert';

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/models/event_model.dart';
import 'package:together_admin/src/models/user_model.dart';
import 'package:together_admin/src/util/globals.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final color_text = Color(0xFF707070);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF231F20),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Image.asset(
              '/images/logo.png',
              width: 200,
              height: 125,
            ),
          ]),
          SizedBox(height: 60),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    'Логин:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                      height: 30,
                      width: 100,
                      child: TextFormField(
                          controller: _nameController,
                          decoration: new InputDecoration(
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                color: color_text,
                              )),
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                color: color_text,
                              ))),
                          cursorColor: color_text,
                          style: TextStyle(fontSize: 15, color: color_text),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Пожалуйста введите логин';
                            else
                              return null;
                          },
                          onSaved: (String val) => {})),
                  new SizedBox(height: 20),
                  new Text(
                    'Пароль:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                      height: 30,
                      width: 100,
                      child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: new InputDecoration(
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                color: color_text,
                              )),
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                color: color_text,
                              ))),
                          cursorColor: color_text,
                          style: TextStyle(fontSize: 15, color: color_text),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Пожалуйста введите пароль';
                            else
                              return null;
                          },
                          onSaved: (String val) => {})),
                  new SizedBox(height: 40),
                  FlatButton(
                      color: Color(0xFF707070),
                      onPressed: () async {
                        String name = _nameController.text;
                        String password = _passwordController.text;
                        if (name == 'together' && password == 'T0gether2020') {
                          var url = 'http://' + Globals.host + ':8080/v1/user/list';
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

                          var urlEvent =
                              'http://' + Globals.host + ':8080/v1/event/list/all';
                          var responseEvent =
                              await http.get(urlEvent, headers: {
                            'Content-Type': 'application/json; charset=utf-8',
                            'Accept': 'application/json; charset=utf-8'
                          });

                          var events = List<Event>();

                          if (responseEvent.statusCode == 200) {
                            var notesJson = json.decode(responseEvent.body);
                            for (var noteJson in notesJson) {
                              events.add(Event.map(noteJson));
                            }
                          }
                          Globals.events = events;
                          Navigator.pushReplacementNamed(context, '/user');
                        }
                      },
                      child: Text(
                        'ВОЙТИ',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))
                ]),
          )
        ],
      ),
    );
  }
}
