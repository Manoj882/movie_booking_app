import 'package:flutter/material.dart';
import 'package:movie_booking_app/repository/models/event_model.dart';
import 'package:movie_booking_app/widgets/item_block.dart';
import 'package:movie_booking_app/widgets/movie_items.dart';

class EventItems extends StatelessWidget {
  const EventItems({required this.events, super.key});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 230,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (_, index) {
          return ItemBlock(
            model: events[index],
            onTap: (model) {},
          );
        },
      ),
    );
  }
}
