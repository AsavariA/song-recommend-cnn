import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/homePage.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../widgets/authScreen.dart';
import '../services/auth.dart';
import '../screens/forgotPassword.dart';
import '../screens/register.dart';
import '../widgets/button.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/Login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AuthMethods authMethods = new AuthMethods();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool _isLoading = false;
  final _passfocus = FocusNode();
  TextStyle loading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.pink
  );

  void login(){
    print('Login');
    setState(() {
      _isLoading = true;
    });
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      setState(() {
        _isLoading = false;
      });
      showErrorDialog("Login Failed", context);
      return;
    }
    _formKey.currentState.save();
    print(_emailController.text);
    print(_passwordcontroller.text);
    authMethods.login(_emailController.text,_passwordcontroller.text).then((value) {
      print(value);
      if(value!=null){
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamed(HomePage.routeName);
      }else{
        setState(() {
          _isLoading = false;
        });
        showErrorDialog("Login Failed", context);
      }
    });
  }

  @override
  void dispose() {
    _passfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? 
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100,
          child: Column(children: [
            JumpingText('Authenticating...',style: loading,),
            JumpingText("Please Wait",style: loading)
          ],)
        ),
      ),
    ) : 
    Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect)=> LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black,Colors.transparent]
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/lg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Flexible(
                child: Center(
                  child: Text(
                    'MoodWiz',
                    style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              TextInputField(
                icon: FontAwesomeIcons.envelope,
                hint: 'Email',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                isObscure: false,
                controller: _emailController,
                focus: _passfocus,
                validator: (value){
                  if(value.isEmpty){
                    return 'Email should not be empty';
                  }
                  return null;
                },
              ),
              TextInputField(
                icon: FontAwesomeIcons.lock,
                hint: 'Password',
                inputType: TextInputType.name,
                inputAction: TextInputAction.done,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: GestureDetector(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 22, 
                      color: Colors.white, 
                      height: 1.5,
                    ),
                  ),
                  onTap: (){
                    print("Forgot");
                    Navigator.of(context).pushNamed(ForgotPassword.routeName);
                  },
                ),
              ),
              SizedBox(height:25),
              RoundedButton(
                buttonName: "Login",
                func: () => login()
              ),
              SizedBox(height:25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 95),
                child: Container(
                  child: GestureDetector(
                    child: Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 22, 
                        color: Colors.white, 
                        height: 1.5,
                      ),
                    ),
                    onTap: (){
                      print("New");
                      Navigator.of(context).pushNamed(CreateNewAccount.routeName);
                    },
                  ),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height:40)
            ],),
          ),
        )
      ],
    );
  }
}