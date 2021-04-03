library config.globals;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


StreamController<bool> isLightTheme = StreamController.broadcast();

class AppTheme extends StatefulWidget {
  @override
  static const routeName = './appTheme';
  _AppThemeState createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  @override
  Widget build(BuildContext context) {
    return /*StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp(
              theme: snapshot.data ? ThemeData.light() : ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home:*/ Scaffold(
                  appBar: AppBar(title: Text('Themes', style: GoogleFonts.alike(fontWeight: FontWeight.bold, color: Colors.black)),
                    backgroundColor: Colors.blueGrey[300],),
                  body: ThemePage(),
                floatingActionButton: FloatingActionButton(
                  onPressed: (){
                   
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.settings, color: Colors.black,),
                  backgroundColor: Colors.blueGrey[200],
                ));
/*
          );
        });*/
  }
}


class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              RaisedButton(
                  color: Colors.blue,
                  child: Text("Light Theme", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    isLightTheme.add(true);
                  }),
              RaisedButton(
                  color: Colors.black,
                  child: Text("Dark Theme", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    isLightTheme.add(false);
                  }),
            ])));
  }
}
