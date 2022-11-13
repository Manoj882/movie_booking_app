import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/cast_crew_block.dart';
import 'package:movie_booking_app/widgets/offer_block.dart';
import 'package:movie_booking_app/widgets/review_block.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  final dynamic model = Get.arguments[0];
  final int index = Get.arguments[1];

  titleWidget(model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${model.title}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.favorite_outlined,
                color: AppTheme.mainColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${model.like}%',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      );

  final screenWidget = Row(
    children: [
      Text(
        'English',
        style: TextStyle(
          color: AppTheme.mainColor,
        ),
      ),
      const SizedBox(width: 10),
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppTheme.mainColor.withOpacity(0.1),
        ),
        child: const Text(
          '3D',
          style: TextStyle(
            color: AppTheme.mainColor,
          ),
        ),
      ),
    ],
  );

  final descriptionWidget = RichText(
    text: TextSpan(
      children: [
        const WidgetSpan(
          child: Icon(
            Icons.history_outlined,
            size: 15,
            color: Colors.black45,
          ),
        ),
        const WidgetSpan(
          child: SizedBox(
            width: 10,
          ),
        ),
        const TextSpan(
          text: '2h 59m',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        const WidgetSpan(
          child: SizedBox(
            width: 10,
          ),
        ),
        WidgetSpan(
          child: SvgPicture.asset(
            'assets/images/menus/theater_masks.svg',
            height: 15,
            width: 15,
            color: Colors.black45,
          ),
        ),
        const WidgetSpan(
          child: SizedBox(
            width: 10,
          ),
        ),
        const TextSpan(
          text: 'Action, Drama',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    ),
  );

  Widget block1(model) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(model),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'UA | Oct 15, 2019',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              Text(
                '1.8k votes',
                style: TextStyle(
                  color: AppTheme.mainColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          screenWidget,
          const SizedBox(
            height: 10,
          ),
          descriptionWidget,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.mainColor,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
              ),
            ),
            title: Text(model.title),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${model.title}$index',
                child: Container(
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(model.bannerUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: const Color(0xFFF5F5FA),
              child: Column(
                children: [
                  block1(model),
                  const SizedBox(height: 20,),
                  const Offersblock(),
                  const SizedBox(height: 20,),
                  const ReviewBlock(),
                  const SizedBox(height: 20,),
                  const CastCrewblock(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
