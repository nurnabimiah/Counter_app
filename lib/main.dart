import 'package:counter_app/pages/Counter_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

MaterialApp MyApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: Counter_app(),
  );
}
