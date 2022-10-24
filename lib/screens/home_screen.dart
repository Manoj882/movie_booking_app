import 'package:flutter/material.dart';
import 'package:movie_booking_app/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(onPressed: (){
            AuthController.instance.logout();
          }, child: Text('Logout'),),
        ),
      ),
      );
  }
}
