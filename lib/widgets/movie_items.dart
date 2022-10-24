import 'package:flutter/material.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/movie_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

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
          return MovieItemBlock(
            model: movies[index],
            isMovie: true,
            onTap: (model) {},
          );
        },
      ),
    );
  }
}

class MovieItemBlock extends StatelessWidget {
  const MovieItemBlock(
      {required this.model,
      this.isMovie = false,
      this.height = 150,
      this.width = 120,
      required this.onTap,
      super.key});

  final MovieModel model;
  final bool isMovie;
  final double height;
  final double width;
  final Function(dynamic model) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                model.bannerUrl,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: width,
              child: Text(
                model.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            isMovie
                ? Row(
                    children: [
                      const Icon(
                        Icons.favorite_outlined,
                        color: AppTheme.mainColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        model.like.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                : Text(
                    model.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
