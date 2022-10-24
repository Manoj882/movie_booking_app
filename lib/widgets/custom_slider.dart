import 'package:flutter/material.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({this.index = 0, super.key});
  final index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      child: Image.asset(
        sliderData[index].url,
        fit: BoxFit.cover,
      ),
    );
  }
}
