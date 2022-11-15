import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/repository/datas/custom_data.dart';
import 'package:movie_booking_app/repository/models/movie_model.dart';
import 'package:movie_booking_app/utils/app_theme.dart';
import 'package:movie_booking_app/widgets/theatre_block.dart';

class ListCinemaScreen extends StatefulWidget {
  const ListCinemaScreen({required this.model, super.key});

  final MovieModel model;

  @override
  State<ListCinemaScreen> createState() => _ListCinemaScreenState();
}

class _ListCinemaScreenState extends State<ListCinemaScreen> {

  final DateFormat format = DateFormat('dd MMM');
  
  final now = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.appBarColor,
        elevation: 0,
        child: Container(
          width: double.maxFinite,
          height: AppBar().preferredSize.height,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    DateTime.now().toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.model.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/search.svg'),
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: theatres.length,
        itemBuilder: (_, index) {
          return Container(
            padding:
                EdgeInsets.only(bottom: index != theatres.length - 1 ? 20 : 0),
            child: TheatreBlock(
              model: theatres[index],
            ),
          );
        },
      ),
    );
  }
}



// class TheatreSearchDelegate extends SearchDelegate<String> {
//   final MovieModel model;
  
//   TheatreSearchDelegate(this.model);
 

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       Container(),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null.toString());
//       },
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_close,
//         progress: transitionAnimation,
//       ),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//         ? theatres
//         : theatres
//             .where(
//               (element) => element.name.toLowerCase().contains(
//                     query.toLowerCase(),
//                   ),
//             )
//             .toList();
//     return LayoutBuilder(builder: (context, constraints) {
//       return GridView.builder(
//         shrinkWrap: true,
//         physics: const BouncingScrollPhysics(),
//         itemCount: suggestionList.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
//           childAspectRatio: 0.8,
//         ),
//         itemBuilder: (_, index) {
//           return resultWidget(
//             suggestionList[index],
//           );
//         },
//       );
//     });
//   }
// }


