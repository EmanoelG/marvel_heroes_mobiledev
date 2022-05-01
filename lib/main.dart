import 'package:flutter/material.dart';
import 'Home/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: appBarTheme(),
      ),
      home: MyHomePage('Marvel app'),
    );
  }

  AppBarTheme appBarTheme() {
    return const AppBarTheme(
      color: Colors.red,
      shadowColor: Colors.black,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
