import 'package:flutter/material.dart';
import './login.dart';
import './index.dart';
import './api.dart';

void main() {
  category();
  runApp(
    MaterialApp(home: Scaffold(
      backgroundColor: Colors.white,
      body: DashPage()
      
      ))
    );
}
