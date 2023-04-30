import 'package:eplant/constants.dart';
import 'package:eplant/views/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../model/Yard.dart';

class YardsScreen extends StatelessWidget {
  YardsScreen({super.key});
  List<Yard> yards = [
    Yard(
        category: 'Outdoor',
        imgUrl:
            'https://previews.123rf.com/images/moccabunny/moccabunny1604/moccabunny160400011/57874908-wood-chair-in-the-flowers-garden.jpg',
        rating: 4,
        title: ''),
    Yard(
        category: 'Climbers',
        imgUrl:
            'https://w0.peakpx.com/wallpaper/366/927/HD-wallpaper-floral-garden-with-chairs-and-lamp-garden.jpg',
        rating: 4,
        title: ''),
    Yard(
        category: 'Outdoor',
        imgUrl:
            'https://previews.123rf.com/images/moccabunny/moccabunny1604/moccabunny160400011/57874908-wood-chair-in-the-flowers-garden.jpg',
        rating: 4,
        title: ''),
    Yard(
        category: 'Climbers',
        imgUrl:
            'https://w0.peakpx.com/wallpaper/366/927/HD-wallpaper-floral-garden-with-chairs-and-lamp-garden.jpg',
        rating: 4,
        title: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () {
            Get.off(MainScreen());
          },
        ),
        title: Text(
          'Yards',
          style: TextStyle(color: blackColor),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: blackColor,
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(yards[index].imgUrl),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Elegant yard with a beatiful view',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              itemSize: 15,
                              ignoreGestures: true,
                              initialRating: yards[index].rating.toDouble(),
                              minRating: 1,
                              unratedColor: Colors.white,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${yards[index].rating.toString()}.0',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(3),
                              color: Colors.white,
                              child: Text(
                                yards[index].category,
                                style: TextStyle(
                                    fontSize: 6, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ]),
                )
              ],
            ),
          );
        },
        itemCount: yards.length,
      ),
    );
  }
}
