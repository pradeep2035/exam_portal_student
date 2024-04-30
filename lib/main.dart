// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sat_exam_portal/screens/dashboards/student_dashboard.dart';
import 'package:sat_exam_portal/screens/spoc_question_creation.dart';
import 'package:sat_exam_portal/screens/auth/login.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/screens/auth/student_register.dart';

import 'screens/dashboards/spoc_dashboard.dart';
import 'screens/exam_portal/exam_portal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Upstair',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryIconTheme: IconThemeData(color: Colors.deepPurple),
      ),
      home: studentDashboard(),
    );
  }
}

