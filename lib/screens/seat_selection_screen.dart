import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/movie_model.dart';
import 'package:movie_booking_app/repository/models/theatre_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/no_of_seats.dart';
import 'package:movie_booking_app/widgets/seat_layout.dart';
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

  Widget bottomBar({required Function(bool) toggle}) => BottomAppBar(
        child: SizedBox(
          height: AppBar().preferredSize.height,
          child: ElevatedButton(
            onPressed: (){
              toggle(!SeatSelectionController.instance.isSeatSelection.value);
              print('Seat selection: ${!SeatSelectionController.instance.isSeatSelection.value}');

            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppTheme.mainColor ,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'Select Seats',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(toggle: SeatSelectionController.instance.isSeatSelection),
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
          Obx(
            () => SeatSelectionController.instance.isSeatSelection.value 
            ? SeatLayout(model: seatLayout)
            : noOfSeatSelection(),
          ),
          // SeatLayout(model: seatLayout),

        ],
      ),
    );
  }
}
