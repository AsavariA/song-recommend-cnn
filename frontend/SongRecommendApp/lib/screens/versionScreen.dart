import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Version extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version'),
        centerTitle: false,
        backgroundColor: Colors.blueGrey[400],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 250),
            Image.asset('assets/version.jpg'),
            SizedBox(height: 200,),
            Text('VERSION 1.0', style: GoogleFonts.average(fontSize: 30))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.settings, color: Colors.black,),
        backgroundColor: Colors.blueGrey[200],
      ),
    );
  }
}



