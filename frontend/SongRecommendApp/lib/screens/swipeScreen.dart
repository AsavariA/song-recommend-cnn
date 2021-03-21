import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/loginPage.dart';

class SwipeScreens extends StatefulWidget {

  static const TextStyle Black30Style = TextStyle(
      fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle Pink45Style = TextStyle(
      fontSize: 45.0, color: Colors.pink, fontWeight: FontWeight.bold);
  static const TextStyle Orange30Style = TextStyle(
      fontSize: 35.0, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold);
  static const TextStyle Orange40Style = TextStyle(
      fontSize: 40.0, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold);
  static const TextStyle White40Style = TextStyle(
      fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle Black40Style = TextStyle(
      fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle Black20Style = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle White20Style = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  @override
  _SwipeScreensState createState() => _SwipeScreensState();
}

class _SwipeScreensState extends State<SwipeScreens> {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
         home: Scaffold(
          body : LiquidSwipe(
            enableSlideIcon: true,
            positionSlideIcon: 0.5,
            enableLoop: false,
            waveType: WaveType.liquidReveal,
            pages: <Container>[
              Container(
                //INTRO PAGE 1
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'MOODWIZ',
                            style: GoogleFonts.alice(textStyle: SwipeScreens.Black20Style),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Image.asset('assets/5870.jpg'),

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Listen Songs',
                            style: GoogleFonts.alike(textStyle: SwipeScreens.Pink45Style),
                          ),
                          Text(
                            'according to your mood',
                            style: GoogleFonts.alike(textStyle: SwipeScreens.Orange30Style),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Just click a picture in this app,\n"
                                "It detects your current mood and DONE! Now relax and enjoy your favourite songs! ",
                            style: GoogleFonts.averageSans(textStyle:SwipeScreens.Black20Style),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //INTRO PAGE 2
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'MOODWIZ',
                            style: GoogleFonts.alice(textStyle: SwipeScreens.Black20Style),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.10, 0.0, 0.10, 0.0),
                      child: Image.asset('assets/second_updated.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Personalised ',
                            style: GoogleFonts.alike(textStyle: SwipeScreens.Pink45Style),
                          ),
                          Text(
                            'Playlist',
                            style: GoogleFonts.alike(textStyle: SwipeScreens.Orange40Style),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Create custom playlists and\n"
                                "jam to your favourites.",
                            style: GoogleFonts.average(textStyle: SwipeScreens.Black20Style),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] ,
          onPageChangeCallback: swipeFinished,
        ),
      ),
    );
  }

  void swipeFinished(int pageNum) {
    if (pageNum == 1) {
      print('page');
      Navigator.of(context).pushNamed(LoginPage.routeName);
    }
  }
}