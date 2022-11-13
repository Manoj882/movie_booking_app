import 'package:flutter/material.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class CastCrewblock extends StatelessWidget {
  const CastCrewblock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Crew & Casts',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All >>',
                  style: TextStyle(
                    color: AppTheme.mainColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: crewCast.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          crewCast[index].image,
                          height: 110,
                          width: 85,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        crewCast[index].name,
                      ),
                    ],
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
