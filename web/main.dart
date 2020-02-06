import 'dart:html';
import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:together_admin/src/main.dart';

main() async {
  await ui.webOnlyInitializePlatform();
  runApp(AdminPanel());
}