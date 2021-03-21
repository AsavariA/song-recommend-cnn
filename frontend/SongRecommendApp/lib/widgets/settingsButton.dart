import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsButton extends StatelessWidget {

  const SettingsButton({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.bgcolor,
    @required this.smalltext,
    this.onpressed
  }):super(key: key);

  final String text;
  final Function onpressed;
  final dynamic icon;
  final Color bgcolor;
  final smalltext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:400,
      height: 80,
      child: FlatButton(
        onPressed: (){},
        padding: EdgeInsets.all(10.0),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0),),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: bgcolor,
              radius: 25,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(icon,color: Colors.white,),
                onPressed: null,
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text, 
                  style: GoogleFonts.alike(fontSize: 20)
                ),
                SizedBox(height: 4,),
                Text(
                  smalltext, 
                  style: GoogleFonts.alike(fontSize: 12)
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}