import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../widgets/backgroundImage.dart';
import '../widgets/button.dart';
import '../widgets/authScreen.dart';
import '../services/auth.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/ForgotPassword';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;

  TextStyle loading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.pink
  );

  AuthMethods authMethods = new AuthMethods();

  void toggleSeen(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void sendPassword(){
    print("Forgot");
    setState(() {
      _isLoading = true;
    });
    print(_emailController.text);
    authMethods.resetPassword(_emailController.text).then((value){
      print(value);
      if(value!=null){
        setState(() {
          _isLoading = false;
        });
      }else{
        setState(() {
          _isLoading = false;
        });
        showErrorDialog("Verification Failed", context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading ? 
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 120,
          child: Column(
            children: [
              JumpingText(
                "We are sending",
                style: loading
              ),
              JumpingText(
                "the link to your email...",
                style: loading
              ),
              JumpingText(
                "Please Wait",
                style: loading
              ),
            ],
          ),
        ),
      ),
    ) : 
    Stack(
      children: [
        BackgroundImage(image: 'assets/guitar.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              "Forgot Password",
              style: GoogleFonts.alike(
                fontSize: 24, 
                color: Colors.white, 
                height: 1.5,
              ),
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.1,),
                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          'Enter your email we will send instruction to reset your password',
                          style:  TextStyle(
                          fontSize: 22, 
                          color: Colors.white, 
                          height: 1.5,
                        ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        isObscure: false,
                        controller: _emailController,
                      ),
                      SizedBox(height: 20,),
                      RoundedButton(
                        buttonName: 'Send',
                        func:() => sendPassword(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}