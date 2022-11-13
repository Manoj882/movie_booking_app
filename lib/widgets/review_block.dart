import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/constant.dart';
import 'package:movie_booking_app/controllers/auth_controller.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1500 reviews',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Write yours >>',
                  style: TextStyle(
                    color: AppTheme.mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(
                picUrl,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        AuthController.instance.user!.displayName ?? 'No Name',
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  const TextSpan(
                    text: '13 November 2022',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            
            subtitle: const Text(
              textAlign:TextAlign.justify, 
              'With all the updates after the last few months the app has improved a lot. Keeps me up to date.',
            ),
          ),
        ],
      ),
    );
  }
}
