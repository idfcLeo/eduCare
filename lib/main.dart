import 'package:educare/RoleSelectionScreen.dart'; // Ensure this is the correct import path
import 'package:educare/teaher_screen/teacher.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'stuident_screens/student.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EduConnectApp());
}

class EduConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduCare',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        hintColor: Colors.amber,
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blueAccent, // Primary button color
          textTheme: ButtonTextTheme.primary, // Text color on buttons
        ),
      ),
      routes: {
        '/': (context) => const RoleSelectionScreen(), // Home screen for role selection
        // Add other routes as needed
        '/studentHome': (context) => const StudentHomeScreen(),
        '/teacherHome': (context) => const TeacherHomeScreen(),
      },
    );
  }
}
