
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_booking_app/controllers/auth_controller.dart';
import 'package:movie_booking_app/screens/signup_screen.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/utils/input_validator.dart';
import 'package:movie_booking_app/utils/social_buttons.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.mainColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/splash_icon.svg'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome Movie Lovers',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Login to book your seat',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                width: _size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login to your account',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppTheme.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Username',
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: AppTheme.greyColor,
                        filled: true,
                      ),
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                        ),
                        fillColor: AppTheme.greyColor,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(InputValidator.validateField('Username', emailController.text.trim()) 
                        && InputValidator.validateField('Password', passwordController.text.trim())
                        ){
                          AuthController.instance.loginUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );

                        }
                        
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            endIndent: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(
                            color: Color(0xFFC1C1C1),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 5,
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SocialLoginButtons(
                      onGoogleClick: () {
                        AuthController.instance.googleLogIn();
                      },
                      onFbClick: () {},
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    child: const Text(
                      'SignUp',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
