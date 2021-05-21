import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/AppStateNotifier.dart';
import 'package:myapp/screens/config.dart';
import 'package:myapp/screens/homePage.dart';
import 'package:myapp/screens/settings.dart';
import 'package:myapp/screens/swipeScreen.dart';
import 'package:myapp/screens/themedemo.dart';
import 'package:myapp/screens/versionScreen.dart';
import 'package:provider/provider.dart';
import './screens/AppStateNotifier.dart';
import './screens/apptheme.dart';
import './screens/forgotPassword.dart';
import './screens/loginPage.dart';
import './screens/register.dart';
import 'package:flutter/material.dart';

StreamController<bool> isLightTheme = StreamController();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp(
              theme: snapshot.data ? ThemeData.light() : ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home: /*Scaffold(
                  appBar: AppBar(title: Text("Dynamic Theme")),
                  body: SettingPage())*/
              SwipeScreens(),
              routes: {
                ForgotPassword.routeName: (ctx) => ForgotPassword(),
                CreateNewAccount.routeName: (ctx) => CreateNewAccount(),
                LoginPage.routeName: (ctx) => LoginPage(),
                HomePage.routeName: (ctx) => HomePage(),
                Settings.routeName: (ctx) => Settings(),
                Version.routeName: (ctx) => Version(),
                ThemeDemo.routeName: (ctx) => ThemeDemo(),
                AppTheme.routeName: (ctx) => AppTheme(),
                Camera.routeName: (ctx) => Camera(),
              }

          );
        });
  }
}
