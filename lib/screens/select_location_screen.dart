import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:location/location.dart';
import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/screens/home_screen.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  var myLocationWidget = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: GestureDetector(
      onTap: () async{
        LocationController.instance.isLocating(true);
        await LocationController.instance.getLocation();
        Get.offAll(() => const HomeScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.greyColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.my_location_outlined,
                color: Colors.black45,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'My Current Location',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget suggestedLocation(String city) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black45,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          city,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(
            (){
            return LoadingOverlay(
              isLoading: LocationController.instance.isLocating.value,
              color: AppTheme.statusBarColor,
              progressIndicator: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppTheme.appBarColor),
              ),
              opacity: 0.3,
              child: Container(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      myLocationWidget,
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cities.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth > 680 ? 5: 3,
                            childAspectRatio: 2.3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: (){
                                LocationController.instance.setCity(cities[index]);
                                Get.offAll(() => const HomeScreen());
                              },
                              child: suggestedLocation(
                                cities[index],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            prefixIconConstraints: const BoxConstraints(
                              maxHeight: 50,
                              maxWidth: 50,
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child:  Icon(
                                Icons.search_outlined,
                                color: Colors.black45,
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: AppTheme.greyColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            }
          );
        }
      ),
    );
  }
}
