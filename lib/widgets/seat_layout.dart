import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_booking_app/repository/models/seat_layout_model.dart';

class SeatLayout extends StatelessWidget {
  SeatLayout({required this.model, super.key});

  final SeatLayoutModel model;
  int alphabetCounter = -1;
  int seatCounter = 0;

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/icons/screen_here.svg'
          ),
          const Text('Screen Here'),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: model.seatTypes.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.seatTypes[index]['price']} ${model.seatTypes[index]['title']}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          model.rowBreaks[index],
                          (row) {
                            alphabetCounter++;
                            return Wrap(
                              children: List.generate(
                                model.columns,
                                (col) {
                                  if(col == 0){
                                    return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          child: Text(String.fromCharCode(65 + alphabetCounter)),
                                          height: 20,
                                          width: 20,
                                        ),
                                      );
                                  }
                                  //making gaps
                                  //making last row filled
                                  if((col == model.gapColumnIndex || col == model.gapColumnIndex + model.gap  - 1 ) &&
                                  (row != model.rowBreaks[index] - 1 && model.isLastFilled)
                                  ){
                                    return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                        ),
                                      ); 
                                  }
                                  //numbering the seats
                                  seatCounter++;

                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xff707070),
                                        ),
                                      ),
                                      // child: Center(child: Text('$col')),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ); 
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
