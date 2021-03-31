import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/screens/themedemo.dart';
import 'package:myapp/widgets/settingsButton.dart';
import './versionScreen.dart';

class Settings extends StatelessWidget {

  static const routeName = './Settings';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey[400],
      ),
      body: Container(
        color: Colors.blueGrey[100],
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
            onpressed: (){},
          ),
          SizedBox(height: 10.0,),
          SettingsButton(
            text: 'Themes',
            icon: Icons.auto_awesome,
            bgcolor: Colors.orange,
            smalltext: 'Select your own theme',
            onpressed: (){
              Navigator.of(context).pushNamed(ThemeDemo.routeName);
            },
          ),
          SizedBox(height: 10.0,),
          SettingsButton(
            text: 'About',
            icon: Icons.android,
            bgcolor: Colors.lightBlue,
            smalltext: 'About the App',
            onpressed: (){},
          ),
          SizedBox(height: 10.0,),
          SettingsButton(
            text: 'Favourites',
            icon: Icons.audiotrack,
            bgcolor: Colors.purple,
            smalltext: 'All your favourites at a single location',
            onpressed: (){},
          ),
          SizedBox(height: 10.0,),
          SettingsButton(
            text: 'My Library',
            icon: Icons.download_outlined,
            bgcolor: Colors.teal,
            smalltext: 'Your own Music',
            onpressed: (){},
          ),
          SizedBox(height: 10.0,),
          SettingsButton(
            text: 'Version',
            icon: Icons.arrow_drop_up_outlined,
            bgcolor: Colors.cyan,
            smalltext: 'Version Info',
            onpressed: (){
              print('version');
              Navigator.of(context).pushNamed(Version.routeName);
            },
          ),
          SizedBox(height: 10.0,),
          SettingsButton(
            text: 'Log Out',
            icon: Icons.account_circle,
            bgcolor: Colors.black,
            smalltext: 'Signout of Current Account',
            onpressed: (){
              print('Signout');
            },
          ),
        ],  
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.home, color: Colors.black,),
      backgroundColor: Colors.blueGrey[200],
    ),
  );
  }
}