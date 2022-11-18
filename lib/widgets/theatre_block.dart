import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/calendar_controller.dart';
import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/repository/models/theatre_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/facilities_bottom_sheet.dart';

class TheatreBlock extends StatelessWidget {
  const TheatreBlock(
      {required this.model,
      this.isBooking = false,
      required this.onTimeTap,
      Key? key})
      : super(key: key);

  final TheatreModel model;
  final bool isBooking;
  final Function(int) onTimeTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var instance = CalendarController.instance;
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
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.63,
                    ),
                    builder: (_) => FacilitiesBottomSheet(
                      model: model,
                    ),
                  );
                },
                child: Icon(
                  Icons.info_outlined,
                  color: Colors.black45.withOpacity(0.3),
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          isBooking 
          ? Text(
            instance.format.format(instance.selectedMovieDate.value),
            style: const TextStyle(
              color: Color(0xff999999),
            ),
          )
          : RichText(
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Color(0xff999999),
                  ),
                ),
                TextSpan(
                  text: LocationController.instance.city.value + ', ',
                  style: const TextStyle(
                    color: Color(0xff999999),
                  ),
                ),
                const TextSpan(
                  text: '2.5km Away',
                  style: TextStyle(color: Color(0xff444444)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Obx(
             () => Wrap(
                runSpacing: 10,
                spacing: 20,
                alignment: WrapAlignment.start,
                children: List.generate(
                  4,
                  (index) {
                    bool isSelected = index == SeatSelectionController.instance.timeSelectedIndex.value && isBooking;
                    Color color =
                        index % 2 == 0 ? AppTheme.orangeColor : AppTheme.greenColor;
                    return GestureDetector(
                      onTap: () {
                        //to select seat
                        onTimeTap(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color:isSelected ? AppTheme.greenColor :const Color(0x22E5E5E5),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color:isSelected ? AppTheme.greenColor : const Color(0xffE5E5E5),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          model.timings[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : color,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
           ),
          
        ],
      ),
    );
  }
}
