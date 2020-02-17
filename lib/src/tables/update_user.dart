import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/models/user_model.dart';
import 'package:together_admin/src/util/custom_dialog.dart';
import 'package:together_admin/src/util/globals.dart';

class UpdateUser extends StatelessWidget {
  final User user;

  UpdateUser(this.user);

  @override
  Widget build(BuildContext context) {
    final color_text = Color(0xFF707070);
    final TextEditingController _nameController =
        TextEditingController(text: user.name);
    final TextEditingController _phoneController =
        TextEditingController(text: user.phone);
    final TextEditingController _facebookController =
        TextEditingController(text: user.facebook);
    final TextEditingController _instagramController =
        TextEditingController(text: user.instagram);
    final TextEditingController _emailController =
        TextEditingController(text: user.email);

    return CustomAlertDialog(
        backgroundColor: Color(0xFF231F20),
        content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 320,
                      child: Text(
                        'Информация о пользователе',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Фамилия и имя:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            ))),
                        cursorColor: color_text,
                        style: TextStyle(fontSize: 20, color: color_text),
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Email:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            ))),
                        cursorColor: color_text,
                        style: TextStyle(fontSize: 20, color: color_text),
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Телефон:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            ))),
                        cursorColor: color_text,
                        style: TextStyle(fontSize: 20, color: color_text),
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Facebook:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _facebookController,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            ))),
                        cursorColor: color_text,
                        style: TextStyle(fontSize: 20, color: color_text),
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Instagram:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _instagramController,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: color_text,
                            ))),
                        cursorColor: color_text,
                        style: TextStyle(fontSize: 20, color: color_text),
                      )),
                  SizedBox(height: 20),
                  ButtonTheme(
                    minWidth: 60,
                    height: 30,
                    child: RaisedButton(
                      onPressed: () async {
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String phone = _phoneController.text;
                        String instagram = _instagramController.text;
                        String facebook = _facebookController.text;

                        var response = await http.post(
                            'http://' + Globals.host + ':8080/v1/user/update',
                            headers: {
                              'Accept': 'application/json; charset=utf-8',
                              'Content-Type': 'application/json; charset=utf-8'
                            },
                            body: jsonEncode({
                              'userId': user.userId,
                              'name': name,
                              'email': email,
                              'phone': phone,
                              'instagram': instagram,
                              'facebook': facebook
                            }));
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Обновить данные',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      color: Color(0xFF707070),
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  ButtonTheme(
                    minWidth: 60,
                    height: 30,
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Отмена',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      color: Color(0xFF707070),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 45),
                  Container(
                      width: 320,
                      child: Text(
                        'БИЛЕТЫ:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  SizedBox(height: 20),
                ],
              )
            ]));
  }
}
