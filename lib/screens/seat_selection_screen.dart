import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/movie_model.dart';
import 'package:movie_booking_app/repository/models/theatre_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/no_of_seats.dart';
import 'package:movie_booking_app/widgets/seat_type.dart';
import 'package:movie_booking_app/widgets/theatre_block.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen(
      {required this.theatreModel, required this.movieModel, super.key});

  final TheatreModel theatreModel;
  final MovieModel movieModel;

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  noOfSeatSelection() {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'How Many Seats?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: SvgPicture.asset(
                    'assets/images/vehicles/${SeatSelectionController.instance.getAsset()}',
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              NoOfSeats(onTap: SeatSelectionController.instance.noOfSeats),
              const SizedBox(
                height: 10,
              ),
              SeatType(onTap: SeatSelectionController.instance.seatType),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movieModel.title,
        ),
      ),
      body: Column(
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(
            height: 10,
          ),
          noOfSeatSelection(),
        ],
      ),
    );
  }
}
