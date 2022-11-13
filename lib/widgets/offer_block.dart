import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/offer_model.dart';
import 'package:dotted_border/dotted_border.dart';

class Offersblock extends StatelessWidget {
  const Offersblock({super.key});

  offerWidget(BuildContext context, OfferModel model) => Padding(
        padding: const EdgeInsets.only(right: 20, left: 5),
        child: DottedBorder(
          color: Colors.black45,
          dashPattern: const [5, 5],
          padding: const EdgeInsets.all(20),
          radius: const Radius.circular(6),
          child: Row(
            children: [
              Container(
                height: double.maxFinite,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: RadialGradient(
                    colors: model.gradientColor,
                    radius: 50,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/images/icons/${model.icon}',
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(
                      color: model.color,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      model.description,
                      style: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Offers',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              itemBuilder: (_, index) {
                return offerWidget(
                  context,
                  offers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
