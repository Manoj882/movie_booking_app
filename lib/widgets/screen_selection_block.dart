import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/common_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/utils/app_theme.dart';

class ScreenSelectionBlock extends StatelessWidget {
  ScreenSelectionBlock({
    super.key,
    required this.onScreenSelect,
    
    });

  Function(String) onScreenSelect;

  @override
  Widget build(BuildContext context) {
    final CommonController controller = CommonController.instance;
    return Container(
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Nepali ${controller.screen.value}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: List.generate(
                screens.length,
                (index) {
                  bool isSelected = controller.screen.value == screens[index];
                  return GestureDetector(
                    onTap: (){
                      onScreenSelect(screens[index]);
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected ? AppTheme.mainColor : AppTheme.greyColor,
                        ),
                        child: Center(
                          child: Text(
                            screens[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
