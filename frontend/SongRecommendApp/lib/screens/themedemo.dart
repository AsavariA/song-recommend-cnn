import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppStateNotifier.dart';

class ThemeDemo extends StatefulWidget {
  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar (
        elevation: 0,
        title: Text('Themes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.blueGrey[400],
        actions: <Widget>[
          Switch(
            value: Provider.of<AppStateNotifier>(context).isDarkModeOn,
            onChanged: (boolVal){
              Provider.of(context).updateTheme(boolVal);
            },
          )
        ]
      ) ,
      body: Container(
      ),
    );
  }
}

