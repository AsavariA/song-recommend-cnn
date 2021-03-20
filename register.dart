import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import './loginPage.dart';
import '../widgets/backgroundImage.dart';
import '../widgets/button.dart';
import '../widgets/authScreen.dart';
import '../services/auth.dart';
import '../services/database.dart';

class CreateNewAccount extends StatefulWidget {
  static const routeName = '/Register';

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {

  AuthMethods authMethods = new AuthMethods();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  bool _isLoading = false;
  final _passfocus = FocusNode();
  final _emailfocus = FocusNode();
  final _checkpassfocus = FocusNode();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextStyle loading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.pink
  );

  void _showSuccessDialog(){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Signed Up Successfully!',
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          'Please Login using your newly created acount.',
          style: TextStyle(color: Colors.blueGrey),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Go to Login Screen',
              style: TextStyle(color: Colors.blueGrey),  
            ),
            onPressed: () {
              Navigator.of(ctx).pushReplacementNamed(LoginPage.routeName);
            },
          )
        ],
      ),
    );
  }

  void signup(){
    setState(() {
      _isLoading = true;
    });
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      print('Not Valid');
      setState(() {
        _isLoading = false;
      });
      showErrorDialog('Please Fill all fields correctly', context);
      return;
    }
    _formKey.currentState.save();
    print('Signup');
    print(_emailController.text);
    print(_passwordcontroller.text);
    print(_namecontroller.text);
    authMethods.signUp(_emailController.text,_passwordcontroller.text).then((value) {
      print(value);
      if(value!=null){
        print('Success');
        setState(() {
          _isLoading = false;
        });
        Map<String,String> userMap = {'username' : _namecontroller.text, 'email' : _emailController.text};
        databaseMethods.uploadUserInfo(userMap);
        _showSuccessDialog();
      }else{
        setState(() {
          _isLoading =  false;
        });
        showErrorDialog("Registration Failed", context);
      }
    });
  }

  @override
  void dispose() {
    _passfocus.dispose();
    _emailfocus.dispose();
    _checkpassfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading ? 
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100,
          child: Column(children: [
            JumpingText('Registering...',style: loading,),
            JumpingText("Please Wait",style: loading)
          ],)
        ),
      ),
    ):
    Stack(
      children: [
        BackgroundImage(image: 'assets/fp.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInputField(
                        icon: FontAwesomeIcons.user,
                        hint: 'Name',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        isObscure: false,
                        controller: _namecontroller,
                        focus: _emailfocus,
                        validator: (_){
                          print('Name');
                          if(_namecontroller.text.isEmpty){
                            return 'Name should not be empty';
                          }
                          return null;
                        },
                      ),
                      TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        isObscure: false,
                        controller: _emailController,
                        focus: _passfocus,
                        focusnode: _emailfocus,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Email should not be empty';
                          }
                          return null;
                        }
                      ),
                      TextInputField(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.next,
                        isObscure: true,
                        controller: _passwordcontroller,
                        focusnode: _passfocus,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Password should not be empty';
                          }
                          return null;
                        },
                      ),
                      TextInputField(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.done,
                        isObscure: true,
                        focus: _checkpassfocus,
                        focusnode: _checkpassfocus,
                        validator: (value) {
                          if(value != _passwordcontroller.text){
                            return 'Password doesnt match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(
                        buttonName: 'Register',
                        func: () => signup()
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 22, 
                                color: Colors.white, 
                                height: 1.5,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}