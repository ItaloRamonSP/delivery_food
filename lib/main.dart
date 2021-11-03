import 'package:flutter/material.dart';
import 'package:telas/pages/confirm_page.dart';
import 'package:telas/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xff993399),
          appBarTheme: AppBarTheme(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/confirm': (context) => ConfirmPage(),
      },
    );
  }
}
