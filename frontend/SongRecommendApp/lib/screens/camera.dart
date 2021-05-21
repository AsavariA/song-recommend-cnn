import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Camera extends StatefulWidget {
  static const routeName = './Camera';

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Image Picker'),
      ),*/
      appBar: AppBar(
        title: Text('Image Picker', style: GoogleFonts.alike(
          fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Center(
        child: _image == null
            ? Text('Capture your mood to jam to your cravings!',style: GoogleFonts.alike(
          fontWeight: FontWeight.normal, fontSize: 17))
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        elevation:10,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.camera_alt, color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blueGrey[200],
      ),
    );
  }
}



