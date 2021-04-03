import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import './settings.dart';

StreamController<bool> isLightTheme = StreamController.broadcast();

class HomePage extends StatefulWidget {
  static const routeName = './Homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
      return MaterialApp(
        theme: snapshot.data ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*backgroundColor: Colors.white,*/
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[300],
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 25),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Settings.routeName);
              },
            ),
          ),
          title: Text('MoodWiz',
              style: GoogleFonts.alike(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/logo.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 15, start: 10, end: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Search music...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: Icon(Icons.mic),
                      prefixIcon: Icon(Icons.search)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "TRENDING",
                      style: GoogleFonts.average(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                         /* color: Colors.black*/
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 175,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/songtype4.jpg",
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Category 1",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/songtype5.jpg',
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Category 2",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/songtype2.jpg',
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Category 3",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/songtype1.jpg',
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Category 4",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "YOUR PLAYLISTS",
                      style: GoogleFonts.average(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          /*color: Colors.black*/
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 175,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/headphones.jpg",
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Recently Played",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/songtype6.jpg",
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Favourites",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/songtype3.jpg",
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Playlist 1",
                              style: GoogleFonts.average(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 55,
                    width: double.infinity,
                    child: ThemePage(),
                ),
                Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(160, 100, 100, 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 35, end: 15),
            child: Container(
                height: 70,
                width: 70,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: "Capture Picture",
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.camera_alt, color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.blueGrey[200],
                  ),
                )
            )
        ),
      ),
    );
  }
  );
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
                  color: Colors.blueGrey[200],
                  child: Text("Light Theme", style: TextStyle(color: Colors.black)),
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
