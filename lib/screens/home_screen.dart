import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_booking_app/constants/constant.dart';
import 'package:movie_booking_app/controllers/auth_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/custom_slider.dart';
import 'package:movie_booking_app/widgets/menu_item.dart';
import 'package:movie_booking_app/widgets/movie_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppTheme.statusBarColor));

    String? avatarUrl = AuthController.instance.user!.photoURL;
    avatarUrl = avatarUrl ?? Constants.dummyAvatar;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: avatarUrl,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name'),
                DropdownButton<String>(
                  value: city,
                  dropdownColor: AppTheme.statusBarColor,
                  isDense: true,
                  underline: SizedBox.shrink(),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  items: cities
                      .map((e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      city = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notification_important_outlined,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(

          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width,
                color: Colors.red,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return CustomSlider(
                      index: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'SEAT CATEGORIES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              CategoryItems(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'RECOMMENDED SEATS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              MovieItems(),
            ],
          ),
        ),
      ),
    );
  }
}
