import 'package:flutter_web/material.dart';
import 'package:together_admin/src/header/header.dart';
import 'package:together_admin/src/tables/event-table.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key, this.title}) : super(key: key);
  final String title;

  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF231F20),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(),
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              SizedBox(width: 50),
              Container(
                height: 400,
                width: 1400,
                color: Colors.white,
                child: EventTable(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
