import 'package:flutter/material.dart';
import 'package:myapp/screens/apptheme.dart';
import 'package:myapp/screens/themedemo.dart';
import 'package:myapp/screens/versionScreen.dart';
import 'package:provider/provider.dart';
import './screens/homePage.dart';
import './screens/settings.dart';
import './screens/swipeScreen.dart';
import './screens/forgotPassword.dart';
import './screens/loginPage.dart';
import './screens/register.dart';
import './screens/AppStateNotifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create:(context)=>
      AppStateNotifier(),
      child: MyApp(),
    )
  );
}

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child){
        return MaterialApp(
            title: 'Song Recommendation App',
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            home: SwipeScreens(),
            routes:{
              ForgotPassword.routeName: (ctx) => ForgotPassword(),
              CreateNewAccount.routeName: (ctx) => CreateNewAccount(),
              LoginPage.routeName: (ctx) => LoginPage(),
              HomePage.routeName: (ctx) => HomePage(),
              Settings.routeName: (ctx) => Settings(),
              Version.routeName: (ctx) => Version(),
              ThemeDemo.routeName: (ctx) => ThemeDemo()
            }
        );
      },
    );
  }
}