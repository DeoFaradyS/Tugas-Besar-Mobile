import 'package:echo/Services/userlist.dart';
import 'package:echo/pages/home_page.dart';
import 'package:echo/pages/login_page.dart';
import 'package:echo/pages/profile_page.dart';
import 'package:echo/pages/register_page.dart';
import 'package:echo/pages/user_list_page.dart';
import 'package:echo/splash_screen/splash_screen_0.dart';
import 'package:echo/splash_screen/splash_screen_1.dart';
import 'package:echo/splash_screen/splash_screen_2.dart';
import 'package:echo/splash_screen/splash_screen_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,

      // --- Routing ---
      initialRoute: '/',
      routes: {
        // --- Guest ---
        '/splash_screen_1': (context) => const SplashScreen1(),
        '/splash_screen_2': (context) => const SplashScreen2(),
        '/splash_screen_3': (context) => const SplashScreen3(),

        // --- User ---
        '/login': (context) => LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/home': (context) => const HomePage(),

        // --- Admin ---
        '/userlist': (context) => const UserListPage(),
      },
    );
  }
}
