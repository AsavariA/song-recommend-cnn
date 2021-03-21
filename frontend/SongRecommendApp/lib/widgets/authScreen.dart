import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
    this.isObscure,
    this.controller,
    this.validator,
    this.focus,
    this.focusnode
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isObscure;
  final TextEditingController controller;
  final dynamic validator;
  final dynamic focus;
  final dynamic focusnode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 35),
      child: Container(
        height: size.height*0.08,
        width: size.width*0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            ),
            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            keyboardType: inputType,
            textInputAction: inputAction,
            obscureText: isObscure,
            controller: controller,
            validator: validator,
            focusNode: focusnode,
            onFieldSubmitted: (_){
              if(focus!=null){
                FocusScope.of(context).requestFocus(focus);
              }
            },
          ),
        ),
      ),
    );
  }
}

dynamic showErrorDialog(String message,BuildContext context){
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'An Error Occurred!',
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.blueGrey
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(color: Colors.blueGrey),
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
