import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movie_booking_app/constants/constant.dart';
import 'package:movie_booking_app/controllers/auth_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/screens/profile_screen.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/custom_slider.dart';
import 'package:movie_booking_app/widgets/event_items.dart';
import 'package:movie_booking_app/widgets/menu_item.dart';
import 'package:movie_booking_app/widgets/movie_items.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];

  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppTheme.statusBarColor));

    String? profileUrl = AuthController.instance.user!.photoURL;
    profileUrl = profileUrl ?? Constants.dummyAvatar;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(const ProfileScreen());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: profileUrl,
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
                Text(AuthController.instance.user!.displayName ?? 'Name'),
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby theatres'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: AppTheme.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.2,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  onMapCreated: (controller) {
                    // _controller.complete(controller);
                  },
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  
                  children: [
                    SvgPicture.asset(
                      'assets/images/menus/spotlights.svg',
                      color: Colors.black.withOpacity(0.8),
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      'Events'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: AppTheme.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              EventItems(events: events),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  
                  children: [
                    SvgPicture.asset(
                      'assets/images/menus/theater_masks.svg',
                      color: Colors.black.withOpacity(0.8),
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      'Plays'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: AppTheme.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              EventItems(events: plays),
            ],
          ),
        ),
      ),
    );
  }
}
