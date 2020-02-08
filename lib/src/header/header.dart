import 'package:flutter_web/material.dart';

class Header extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 50),
        Image.asset(
          '/images/logo.png',
          width: 400,
          height: 125,
        ),
        SizedBox(width: 130),
        FlatButton(
            color: Color(0x00000000),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/user');
            },
            child: Text(
              'Пользователи',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
        SizedBox(width: 50),
        FlatButton(
            color: Color(0x00000000),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/event');
            },
            child: Text(
              'Мероприятия',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
        SizedBox(width: 50),
        FlatButton(
            color: Color(0x00000000),
            onPressed: () {},
            child: Text(
              'Администрирование',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            )),
      ],
    );
  }
}
