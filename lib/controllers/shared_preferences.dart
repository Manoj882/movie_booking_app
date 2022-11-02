

import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static late SharedPreferences sharedPref;
  static storeLocation(String city) async{
    sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('location', city);
  }

  static Future<String> getLocation() async{
    sharedPref = await SharedPreferences.getInstance();
    String city = 'NA';
    try{
      city = sharedPref.getString('location')!;
    } catch (e){

    }
    LocationController.instance.setCity(city);
    return city;
  }


}