import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_booking_app/screens/home_screen.dart';
import 'package:movie_booking_app/screens/login_screen.dart';
import 'package:movie_booking_app/utils/app_theme.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLogging = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLogging ? 0 : 2), (){
      if (user == null) {
        isLogging = false;
        update();
      Get.offAll(() =>  LoginScreen());
    } else {
      isLogging = true;
      update();
      Get.offAll(() => const HomeScreen());
    }
        
      });
    
  }

  void registerUser(String email, String password) async {
    try {
      isLogging = true;
      update();
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar('Account Creating Failed', e);
    }
  }

  void loginUser(String email, String password) async {
    try{
      isLogging = true;
      update();
      await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    } on FirebaseAuthException catch (e){
      getErrorSnackBar('Login failed', e);
    }
    
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      'Error',
      '$message\n${_.toString()}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppTheme.redTextColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10,
      ),
    );
  }

  void googleLogIn() async{
    
    try{
      isLogging = true;
      update();
      final googleSignInAccount = await googleSignIn.signIn();
      if(googleSignInAccount != null){
        final googleAuth = await googleSignInAccount.authentication;
        final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await firebaseAuth.signInWithCredential(credentials);
        
        
      }
    } on FirebaseAuthException catch (e){
      getErrorSnackBar('Google Login Failed', e);

    }
  }

  void logout()async{
    await firebaseAuth.signOut();
    await googleSignIn.disconnect();

  }
}
