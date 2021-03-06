import 'package:flutter/material.dart';

import 'package:foddy_world/home_page.dart';

void main() {
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
 
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.grey,
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
      ),
      home: const HomePage(),
      
    );
  }
}
