
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sat_exam_portal/screens/dashboards/student_dashboard.dart';
import 'package:sat_exam_portal/screens/registered_students.dart';
import 'package:sat_exam_portal/screens/spoc_question_creation.dart';
import 'package:sat_exam_portal/screens/auth/login.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/screens/auth/student_register.dart';

import 'screens/dashboards/spoc_dashboard.dart';
import 'screens/exam_portal/exam_portal_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyB78JiyfRURj8K2u5BxiMylOHcxb61QGxo',
      appId: '1:66278324134:web:7b4958ee1bbf25fa3cc167',
      messagingSenderId: '66278324134',
      projectId: 'upstair-exam-portal')
   );
  }else{
   await Firebase.initializeApp();
  }
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
      home: LoginPage(),
    );
  }
}

