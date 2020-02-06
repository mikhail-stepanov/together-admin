import 'package:flutter_web/material.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key, this.title}) : super(key: key);
  final String title;

  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
                    'Будущие ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              SizedBox(width: 100),
              FlatButton(
                  color: Color(0x00000000),
                  onPressed: () {},
                  child: Text(
                    'Прошедшие  ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ],
          ),
          SizedBox(height: 50),
          Container(
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Название')),
                  DataColumn(label: Text('Описание')),
                  DataColumn(label: Text('Дата и время')),
                  DataColumn(label: Text('Место')),
                  DataColumn(label: Text('Ссылка на видео')),
                  DataColumn(label: Text('Ссылка на изображение')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('TOGETHER NEW YEAR',),),
                      DataCell(Text('Новый год Together!')),
                      DataCell(Text('01.01.2020')),
                      DataCell(Text('Ресторан Центрального Дома Литераторов. Москва ул. Поварская 50/53 стр. 1')),
                      DataCell(Text('-')),
                      DataCell(Text('-'))
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
