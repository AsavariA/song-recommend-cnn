import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/apptheme.dart';
import 'package:myapp/screens/themedemo.dart';
import 'package:myapp/widgets/settingsButton.dart';
import './versionScreen.dart';

class Settings extends StatefulWidget {

  static const routeName = './Settings';

  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot)
    {
      return MaterialApp(
          theme: snapshot.data ? ThemeData.light() : ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home:Scaffold(
        /*backgroundColor: Colors.blueGrey[100],*/
        appBar: AppBar(
          title: Text('Settings', style: GoogleFonts.alike(
              fontWeight: FontWeight.bold, color: Colors.black)),
          backgroundColor: Colors.blueGrey[300],
        ),
        body: Container(
          /*color: Colors.blueGrey[100],*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 10.0),
              SettingsButton(
                text: 'Edit Profile',
                icon: Icons.auto_fix_normal,
                bgcolor: Colors.pink,
                smalltext: 'Customize your Profile',
                onpressed: () {
                  print('Profile');
                },
              ),
              SizedBox(height: 10.0,),
              SettingsButton(
                text: 'About',
                icon: Icons.android,
                bgcolor: Colors.lightBlue,
                smalltext: 'About the App',
                onpressed: () {
                  print('About');
                },
              ),
              SizedBox(height: 10.0,),
              SettingsButton(
                text: 'Favourites',
                icon: Icons.audiotrack,
                bgcolor: Colors.purple,
                smalltext: 'All your favourites at a single location',
                onpressed: () {
                  print('Favs');
                },
              ),
              SizedBox(height: 10.0,),
              SettingsButton(
                text: 'My Library',
                icon: Icons.download_outlined,
                bgcolor: Colors.teal,
                smalltext: 'Your own Music',
                onpressed: () {},
              ),
              SizedBox(height: 10.0,),
              SettingsButton(
                text: 'Version',
                icon: Icons.arrow_drop_up_outlined,
                bgcolor: Colors.cyan,
                smalltext: 'Version Info',
                onpressed: () {
                  print('Version');
                  /* Navigator.push(context, MaterialPageRoute(builder: (context) =>Version()));*/
                  Navigator.of(context).pushNamed(Version.routeName);
                },
              ),
              SizedBox(height: 10.0,),
              SettingsButton(
                text: 'Log Out',
                icon: Icons.account_circle,
                bgcolor: Colors.black,
                smalltext: 'Signout of Current Account',
                onpressed: () {
                  print('Logout');
                },
              ),
              SizedBox(height: 50.0,),
              Container(
                height: 55,
                width: double.infinity,
                child: ThemePage(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.home, color: Colors.black,),
          backgroundColor: Colors.blueGrey[200],

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
