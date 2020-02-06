import 'package:flutter_web/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);
  final String title;

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Row(
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
                    Navigator.pushReplacementNamed(
                        context, '/user');
                  },
                  child: Text(
                    'Пользователи',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
              SizedBox(width: 50),
              FlatButton(
                  color: Color(0x00000000),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/event');
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
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
            ],
          ),
          SizedBox(height: 80),
          Row(
            children: <Widget>[
              SizedBox(width: 100),
              SizedBox(width: 300),
              FlatButton(
                  color: Color(0x00000000),
                  onPressed: () {},
                  child: Text(
                    'Все ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              SizedBox(width: 100),
              FlatButton(
                  color: Color(0x00000000),
                  onPressed: () {},
                  child: Text(
                    'Подтвержденные',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              SizedBox(width: 100),
              FlatButton(
                  color: Color(0x00000000),
                  onPressed: () {},
                  child: Text(
                    'Ожидающие',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ],
          ),
          SizedBox(height: 50),
          Container(
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Имя и фамилия')),
                  DataColumn(label: Text('Телефон')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Facebook')),
                  DataColumn(label: Text('Instagram')),
                  DataColumn(label: Text('Подтвержден')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Mikhail Stepanov',),),
                      DataCell(Text('+79250351619')),
                      DataCell(Text('heirloon@mail.ru')),
                      DataCell(Text('-')),
                      DataCell(Text('-')),
                      DataCell(Text('+'))
                    ],
                    onSelectChanged: (bool selected) {},
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Valeriya Semykina')),
                      DataCell(Text('+79099382319')),
                      DataCell(Text('semykinava@yandex.ru')),
                      DataCell(
                          Text('https://www.facebook.com/valery.semykina')),
                      DataCell(Text('-')),
                      DataCell(Text('+'))
                    ],
                    onSelectChanged: (bool selected) {},
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Inozemtsev max')),
                      DataCell(Text('+79163764455')),
                      DataCell(Text('danser554@gmail.com')),
                      DataCell(Text('-')),
                      DataCell(Text('-')),
                      DataCell(Text('+'))
                    ],
                    onSelectChanged: (bool selected) {},
                  )
                ],
              )),
          SizedBox(height: 80),
          Row(
            children: <Widget>[
              SizedBox(width: 100),
              SizedBox(width: 300),
              FlatButton(
                  color: Color(0x00000000),
                  onPressed: () {},
                  child: Text(
                    'Отправить изменения',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
