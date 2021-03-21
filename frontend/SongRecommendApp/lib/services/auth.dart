import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/user.dart';

class AuthMethods{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(user.uid) : null;
  }

  Future login(String email, String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future<dynamic> signUp(String email, String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
      return;
    }
  }

  Future resetPassword(String email)async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

  // Future signOut()async{
  //   try{
  //     HelperFunction.isUserLoggedIn(false);
  //     return await _auth.signOut();
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }
}