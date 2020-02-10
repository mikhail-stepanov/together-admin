import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:together_admin/src/util/globals.dart';
import 'package:http/http.dart' as http;

class AddEvent extends StatelessWidget {
  final color_text = Color(0xFF707070);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ticketcloudController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
        backgroundColor: Color(0xFF231F20),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Добавление мероприятия',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Название:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextFormField(
                controller: _titleController,
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
                validator: (value) {
                  if (value.isEmpty) return 'Пожалуйста введите название';
                }),
            SizedBox(height: 20),
            Text(
              'Описание:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextFormField(
                controller: _descriptionController,
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
                validator: (value) {
                  if (value.isEmpty) return 'Пожалуйста введите описание';
                }),
            SizedBox(height: 20),
            Text(
              'Место:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextFormField(
                controller: _placeController,
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
                validator: (value) {
                  if (value.isEmpty) return 'Пожалуйста введите место';
                }),
            SizedBox(height: 20),
            Text(
              'Время и дата:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextFormField(
                controller: _dateController,
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
                validator: (value) {
                  if (value.isEmpty) return 'Пожалуйста введите дату';
                }),
            SizedBox(height: 20),
            Text(
              'Ссылка на TicketCloud:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextFormField(
                controller: _ticketcloudController,
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
                validator: (value) {
                  if (value.isEmpty)
                    return 'Пожалуйста введите ссылку на ticketcloud';
                }),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 60,
              height: 30,
              child: RaisedButton(
                onPressed: () async {
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  String place = _placeController.text;
                  String date = _dateController.text;
                  String ticketcloud = _ticketcloudController.text;
                  var response = await http.post(
                      'http://' + Globals.host + ':8080/v1/event/add',
                      headers: {
                        'Accept': 'application/json; charset=utf-8',
                        'Content-Type': 'application/json; charset=utf-8'
                      },
                      body: jsonEncode({
                        'title': title,
                        'place': place,
                        'date': date,
                        'picBigId': 1,
                        'picSmallId': 1,
                        'video': 1,
                        'description': description,
                        'ticketcloud': ticketcloud,
                        'isFuture': true,
                        'youtube': "-",
                        'soundcloud': "-",
                        'cloud': "-"
                      }));
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Отправить',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Color(0xFF707070),
                textColor: Colors.white,
              ),
            ),
          ],
        ));
  }
}
