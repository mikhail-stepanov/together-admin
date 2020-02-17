import 'package:flutter_web/material.dart';

class Header extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          '/images/logo.png',
          width: 200,
          height: 125,
        ),
        SizedBox(width: 230),
        FlatButton(
            highlightColor: Color(0x80707070),
            focusColor: Color(0x80707070),
            color: Color(0x00000000),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/user');
            },
            child: Text(
              'Пользователи    ',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
        SizedBox(width: 50),
        FlatButton(
            highlightColor: Color(0x80707070),
            focusColor: Color(0xFF707070),
            color: Color(0x00000000),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/event');
            },
            child: Text(
              'Мероприятия    ',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
        SizedBox(width: 50),
        FlatButton(
            color: Color(0x00000000),
            onPressed: () {},
            child: Text(
              'Администрирование    ',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            )),
      ],
    );
  }
}
