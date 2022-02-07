import 'package:flutter/material.dart';

import 'package:luna/pages/home_page.dart';
import 'package:luna/pages/chat_page.dart';
import 'package:luna/pages/register_page.dart';
import 'package:luna/pages/login_page.dart';
import 'package:luna/pages/launch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaunchPage(),
    );
  }
}
