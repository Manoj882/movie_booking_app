import 'package:flutter/material.dart';
import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/repository/models/theatre_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class TheatreBlock extends StatelessWidget {
  const TheatreBlock({required this.model, Key? key}) : super(key: key);

  final TheatreModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
              ),
              Icon(
                Icons.info_outlined,
                color: Colors.black45.withOpacity(0.3),
                size: 25,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Color(0xff999999),
                  ),
                ),
                TextSpan(
                  text: LocationController.instance.city.value + ', ',
                  style: TextStyle(
                    color: Color(0xff999999),
                  ),
                ),
                TextSpan(
                  text: '2.5km Away',
                  style: TextStyle(color: Color(0xff444444)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 10,
            spacing: 20,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) {
                Color color =
                    index % 2 == 0 ? AppTheme.orangeColor : AppTheme.greenColor;
                return GestureDetector(
                  onTap: (){},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Color(0x22E5E5E5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffE5E5E5),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text(
                      model.timings[index],
                      style: TextStyle(
                        color: color,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
