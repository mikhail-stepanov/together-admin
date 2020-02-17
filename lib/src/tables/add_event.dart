import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/util/custom_dialog.dart';
import 'package:together_admin/src/util/globals.dart';

class AddEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color_text = Color(0xFF707070);
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();
    final TextEditingController _placeController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    final TextEditingController _ticketcloudController =
        TextEditingController();
    final TextEditingController _bigImageController = TextEditingController();
    final TextEditingController _smallImageController = TextEditingController();
    final TextEditingController _videoController = TextEditingController();
    final TextEditingController _youtubeController = TextEditingController();
    final TextEditingController _soundcloudController = TextEditingController();

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
                        'Добавление мероприятия',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Название:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
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
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Описание:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
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
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Место:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
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
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Время и дата:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
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
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: Text(
                        'Ссылка на TicketCloud:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
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
                      )),
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
                        String bigPic = _ticketcloudController.text;
                        String smallPic = _ticketcloudController.text;
                        String video = _ticketcloudController.text;
                        String youtube = _ticketcloudController.text;
                        String soundcloud = _ticketcloudController.text;

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
                              'picBig': bigPic,
                              'picSmall': smallPic,
                              'video': video,
                              'description': description,
                              'ticketcloud': ticketcloud,
                              'isFuture': true,
                              'youtube': youtube,
                              'soundcloud': soundcloud,
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
                        'Ссылка на осн. изображение:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _bigImageController,
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
                        'Ссылка на доп. изображение:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _smallImageController,
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
                        'Ссылка на видео:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _videoController,
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
                        'YouTube:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _youtubeController,
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
                        'SoundCloud:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Container(
                      width: 320,
                      child: TextField(
                        controller: _soundcloudController,
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
                ],
              )
            ]));
  }
}
