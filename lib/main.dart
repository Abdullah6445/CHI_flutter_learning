import 'package:firebase_project_practice/PAGES/contact_list.dart';
import 'package:firebase_project_practice/PAGES/easyPaisa.dart';
import 'package:firebase_project_practice/PAGES/easypaisa_page.dart';
import 'package:firebase_project_practice/PAGESS/dash_board.dart';
import 'package:flutter/material.dart';

import 'dashboard/dashboard_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Paisa',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false,
      ),
      home: DashBoard(),
    );
  }
}
