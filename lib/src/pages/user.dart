import 'package:flutter_web/material.dart';
import 'package:together_admin/src/header/header.dart';
import 'package:together_admin/src/tables/user-table.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);
  final String title;

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                child: UserTable(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
