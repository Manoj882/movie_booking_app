import 'package:flutter/material.dart';

import '../repository/models/movie_model.dart';
import '../utils/app_theme.dart';

class ItemBlock extends StatelessWidget {
  const ItemBlock(
      {required this.model,
      this.isMovie = false,
      this.height = 150,
      this.width = 120,
      required this.onTap,
      super.key});

  final dynamic model;
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