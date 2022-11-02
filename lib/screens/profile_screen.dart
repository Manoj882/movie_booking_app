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

class _ProfileScreenState extends State<ProfileScreen> {

@override
  void initState() {
    super.initState();
    Get.put(ProfileController());
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppTheme.appBarColor),
    );

    String? profileUrl = AuthController.instance.user!.photoURL;
    profileUrl = profileUrl ?? Constants.dummyAvatar;
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
            SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text('Name'),
                  ),
                  Obx(
                    (){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        readOnly: ProfileController.instance.isEdit.value,
                        initialValue: 'Ram',
                        style: TextStyle(color: Colors.black),
                        
                        decoration: InputDecoration(
                  
                          border: const OutlineInputBorder(borderSide: BorderSide.none),
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
                            onTap: (){
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
                ],
              ),
            ),
            Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width * 0.5 - 60,
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
            Positioned(
              top: 170,
              left: MediaQuery.of(context).size.width * 0.5 + 20,
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
          ],
        ),
      ),
    );
  }
}
