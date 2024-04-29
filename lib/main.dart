

import 'package:flutter/material.dart';
import 'package:sample/screens/splash.dart';

const SAVE_LOGIN = 'user_Logged_in';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: ScreenSplash(),
    );
  }

}