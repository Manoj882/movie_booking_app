import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class FacilitiesBottomSheet extends StatelessWidget {
  const FacilitiesBottomSheet({Key? key, required this.model})
      : super(key: key);

  final dynamic model;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(20),
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
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
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff999999),
                        size: 25,
                      ),
                    ),
                    TextSpan(
                      text: LocationController.instance.city.value,
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.fullAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff999999),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available facilities',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.facilities.length,
                  itemBuilder: (_, index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppTheme.redGiftGradientColors[0],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                facilityAsset[index],
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                          Text(
                            model.facilities[index],
                            style: TextStyle(
                              color:  Color(0xff999999),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Center(
            child: CircleAvatar(
              backgroundColor: AppTheme.mainColor,
              radius: 40,
              child: SvgPicture.asset(
                'assets/images/icons/gps.svg',
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
