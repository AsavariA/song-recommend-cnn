import 'package:myapp/screens/homePage.dart';
import 'package:myapp/screens/settings.dart';
import 'package:myapp/screens/versionScreen.dart';

import './screens/forgotPassword.dart';
import './screens/loginPage.dart';
import './screens/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Recommendation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.averageTextTheme(Theme.of(context).textTheme),
        cursorColor: Colors.white
      ),
      home: LoginPage(),
      routes:{
        ForgotPassword.routeName: (ctx) => ForgotPassword(),
        CreateNewAccount.routeName: (ctx) => CreateNewAccount(),
        LoginPage.routeName: (ctx) => LoginPage(),
        HomePage.routeName: (ctx) => HomePage(),
        Settings.routeName: (ctx) => Settings(),
      }
    );
  }
}