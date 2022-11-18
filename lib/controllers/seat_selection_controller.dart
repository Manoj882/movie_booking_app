

import 'package:get/get.dart';

class SeatSelectionController extends GetxController{
  static SeatSelectionController instance = Get.find();
  RxInt timeSelectedIndex = 0.obs;

  static int initialValue = -1;

  RxInt noOfSeats = initialValue.obs;

  RxInt seatType = initialValue.obs;

  updateNoOfSeats(int value){
    noOfSeats = value.obs;
    update();
  }

  String getAsset(){
    int val = noOfSeats.value;
    if(val <= 2){
      return 'vespa.svg';
    } else if (val > 2 && val <= 4){
      return 'car.svg';
    } else if(val > 4 && val<= 8){
      return 'van.svg';
    }
    return 'bus.svg';
  }
}