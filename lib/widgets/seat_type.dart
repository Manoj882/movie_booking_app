import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class SeatType extends StatelessWidget {
  const SeatType({required this.onTap, super.key});

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: List.generate(
            seatLayout.seatTypes.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: GestureDetector(
                onTap: () {
                  onTap(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        index == SeatSelectionController.instance.seatType.value
                            ? AppTheme.greenColor
                            : const Color(0xfffcfcfc),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.5,
                      color: index ==
                              SeatSelectionController.instance.seatType.value
                          ? AppTheme.greenColor
                          : const Color(0xffe5e5e5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${seatLayout.seatTypes[index]['title']}',
                        style: TextStyle(
                          color: index ==
                                  SeatSelectionController
                                      .instance.seatType.value
                              ? Colors.white
                              : const Color(0xff999999),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\u20B9 ${seatLayout.seatTypes[index]['price']}',
                        style: TextStyle(
                          color: index ==
                                  SeatSelectionController
                                      .instance.seatType.value
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${seatLayout.seatTypes[index]['status']}',
                        style: TextStyle(
                          color: index ==
                                  SeatSelectionController
                                      .instance.seatType.value
                              ? Colors.white
                              : const Color(0xff999999),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ),
    );
  }
}
