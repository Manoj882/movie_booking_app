import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/common_controller.dart';
import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/menu_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/item_block.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  //getting argument
  MenuModel menu = Get.arguments;

  late List<dynamic> list;

  final selectedTextStyle = const TextStyle(color: AppTheme.mainColor,);
  final normalTextStyle = const TextStyle(color: Colors.black45,);

  @override
  void initState() {
    if (menu.name.contains("Event")) {
      list = events;
    } else if (menu.name.contains("Movie")) {
      list = movies;
    } else {
      list = plays;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        CommonController.instance.tabController.animateTo(0);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${menu.name} in ${LocationController.instance.city}',
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(
                    list: list,
                    isMovie: menu.name.toLowerCase().contains('movies'),
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/images/search.svg',
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                tabs: CommonController.instance.tabs,
                controller: CommonController.instance.tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppTheme.mainColor,
                    width: 3,
                  ),
                  insets: EdgeInsets.all(15),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelStyle: selectedTextStyle,
                unselectedLabelColor: Colors.black45,
                labelColor: AppTheme.mainColor,
                isScrollable: false,
                enableFeedback: false,
                unselectedLabelStyle: normalTextStyle,
                onTap: (index)=> CommonController.instance.updatePage(index),
              ),
            ),
            Expanded(
              flex: 10,
              child: PageView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: CommonController.instance.pageController,
                  itemBuilder: (_, index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return GridView.builder(
                        itemCount: list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (_, index) {
                          return ItemBlock(
                            model: list[index],
                            onTap: (model) {},
                            isMovie: menu.name.toLowerCase().contains('movies'),
                            height: 180,
                            width: 150,
                          );
                        },
                      );
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  final bool isMovie;
  final List<dynamic> list;
  MySearchDelegate({this.isMovie = false, required this.list});
  resultWidget(dynamic model) {
    return ItemBlock(
      model: model,
      onTap: (model) {},
      height: 180,
      width: 150,
      isMovie: isMovie,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null.toString());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? list
        : list
            .where(
              (element) => element.title.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: suggestionList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (_, index) {
          return resultWidget(
            suggestionList[index],
          );
        },
      );
    });
  }
}
