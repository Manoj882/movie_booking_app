import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class NoOfSeats extends StatelessWidget {
  const NoOfSeats({
    required this.onTap,
    super.key});

  final Function(int) onTap;



  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List.generate(
              seat.length,
              (index) => GestureDetector(
                onTap: () {
                  onTap(index + 1);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: index + 1 ==
                            SeatSelectionController
                                .instance.noOfSeats.value
                        ? AppTheme.greenColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: index + 1 == SeatSelectionController.instance.noOfSeats.value ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}