import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/profile_controller.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

import '../constants/constant.dart';
import '../controllers/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _animationImage, _animationCamera;
  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationImage = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.4)).animate(_animationController);
    _animationCamera = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -1.1)).animate(_animationController);

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppTheme.appBarColor),
    );

    String? profileUrl = AuthController.instance.user!.photoURL;
    profileUrl = profileUrl ?? Constants.dummyAvatar;
    String? name = AuthController.instance.user!.displayName ?? 'No Name';
    String? email = AuthController.instance.user!.email;
    String? contact = AuthController.instance.user!.phoneNumber ?? '0000000000';
    nameController.text = name;
    emailController.text = email!;
    contactController.text = contact;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification){
                if(notification.metrics.pixels == notification.metrics.maxScrollExtent){
                  _animationController.forward();
                } else if (notification.metrics.pixels == notification.metrics.minScrollExtent * 0.5){
                  _animationController.reverse();

                }
                print(notification.metrics.pixels);
                return true;

              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: AppTheme.appBarColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text('Name'),
                    ),
                    Obx(
                      () {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            readOnly: ProfileController.instance.isEdit.value,
                            initialValue: name,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFE4EDFF),
                                  ),
                                  child: const Icon(
                                    Icons.person_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEdit();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text('Email'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: email,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE4EDFF),
                              ),
                              child: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFF4C7EFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text('Contact'),
                    ),
                    Obx(
                      () {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            readOnly: ProfileController.instance.isEdit.value,
                            initialValue: contact,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFE4EDFF),
                                  ),
                                  child: const Icon(
                                    Icons.phone_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEdit();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: AppTheme.greyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Documentation'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.privacy_tip_outlined,
                          size: 20,
                        ),
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.share_outlined,
                          size: 20,
                        ),
                        title: const Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        onTap: () {
                          AuthController.instance.logout();
                        },
                        leading: const Icon(
                          Icons.logout_outlined,
                          size: 20,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width * 0.5 - 60,
              child: SlideTransition(
                position: _animationImage,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        imageUrl: profileUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              left: MediaQuery.of(context).size.width * 0.5 + 20,
              child: SlideTransition(
                position: _animationCamera,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppTheme.appBarColor,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
