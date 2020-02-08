import 'package:flutter_web/material.dart';
import 'package:together_admin/src/pages/event.dart';
import 'package:together_admin/src/pages/login.dart';
import 'package:together_admin/src/pages/user.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Together Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: UserPage(title: 'Together Admin Panel'),
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => LoginPage(),
          '/user': (BuildContext context) => UserPage(),
          '/event': (BuildContext context) => EventPage()
        });
  }
}
