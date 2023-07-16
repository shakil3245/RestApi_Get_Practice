import 'package:apipractice/userbookModel.dart';
import 'package:flutter/material.dart';

import 'getApiCall_StartwithArray.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  UserBookModel(),
    );
  }
}
