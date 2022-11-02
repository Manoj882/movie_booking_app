import 'package:flutter/material.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/movie_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

import 'item_block.dart';

class MovieItems extends StatelessWidget {
  const MovieItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 250,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, index) {
          return ItemBlock(
            model: movies[index],
            isMovie: true,
            onTap: (model) {},
          );
        },
      ),
    );
  }
}


