import 'package:eplant/constants.dart';
import 'package:eplant/controllers/add_to_cart_controller.dart';
import 'package:eplant/views/screens/plant_screen.dart';
import 'package:eplant/views/screens/pot_screen.dart';
import 'package:eplant/views/screens/yards_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ScrollController _scrollController = ScrollController();

  Rx<List<Product>> bestSellers = Rx<List<Product>>([
    Product(
        catogery: Catogery.Plant,
        description: 'It is a species of flower in many countries...',
        imgUrl:
            'https://thumbs.dreamstime.com/b/fuchsia-flower-houseplants-flower-pot-isolated-white-background-31233752.jpg',
        name: 'Fuchsia',
        productId: 'disjfiewefejwzvcbfijefjoj',
        price: '\$25'),
    Product(
        catogery: Catogery.Plant,
        description: 'It is a species of flower in many countries...',
        imgUrl:
            'https://thumbs.dreamstime.com/b/bush-pink-petunia-flower-pot-white-background-isolated-188496773.jpg',
        name: 'Petunia',
        productId: 'disjfiejsdfefwwefefefewfijefjoj',
        price: '\$20'),
    Product(
        catogery: Catogery.Plant,
        description: 'It is a species of flower in many countries...',
        imgUrl:
            'https://www.westend61.de/images/0000252615i/potted-plant-of-calendula-flowers-on-white-background-close-up-CSF019771.jpg',
        name: 'Calendula',
        productId: 'disjfiejsdfefekjnwesdfaifjiejfiejfwefewfijefjoj',
        price: '\$21'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg'))),
                      ),
                      Icon(
                        Icons.notifications_none,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Welcome To ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 23),
                        children: [
                          TextSpan(
                              text: 'E-Plant',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: greenColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: greenColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Colors.grey.withOpacity(0.5)),
                          top: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          left: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          right:
                              BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                        color: secondaryBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        categoryIcon('assets/images/plant.png', 'Plants', () {
                          Get.to(PlantScreen());
                        }),
                        categoryIcon('assets/images/pot.png', 'Pots', () {
                          Get.to(PotScreen());
                        }),
                        categoryIcon('assets/images/yards.png', 'Yards', () {
                          Get.to(YardsScreen());
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Selling',
                        style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      Row(
                        children: [
                          IconButton(
                            color: Colors.black,
                            splashRadius: 10,
                            icon: Icon(Icons.chevron_left_rounded),
                            onPressed: () {
                              _scrollController.animateTo(
                                _scrollController.offset - 250,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                          IconButton(
                            color: Colors.black,
                            splashRadius: 10,
                            icon: Icon(Icons.chevron_right_rounded),
                            onPressed: () {
                              _scrollController.animateTo(
                                _scrollController.offset + 250,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 320,
                    child: Obx(
                      () => ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: bestSellers.value.length,
                        itemBuilder: (context, index) {
                          Product _item = bestSellers.value[index];
                          String _itemId = bestSellers.value[index].productId;
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Center(
                                          child: Text(
                                            '40% off',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              )
                                            ]),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ]),
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(_item.imgUrl),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _item.name,
                                          style: TextStyle(
                                              color: blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              size: 12,
                                              Icons.star,
                                              color: greenColor,
                                            ),
                                            Text(
                                              '5.0',
                                              style: TextStyle(
                                                  color: greenColor,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'It is a species of flowering plant in...',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(20, 20),
                                                  backgroundColor: greenColor),
                                              onPressed: () {},
                                              child: Text(
                                                'Details',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            GetBuilder<AddToCartController>(
                                                builder: (controller) =>
                                                    GestureDetector(
                                                        onTap: () {
                                                          AddToCartController
                                                              .instance
                                                              .cartfunction(
                                                                  _item,
                                                                  _itemId);

                                                          AddToCartController
                                                              .instance
                                                              .update();
                                                        },
                                                        child: controller
                                                                .addedItemsId
                                                                .value
                                                                .contains(
                                                                    _itemId)
                                                            ? Icon(
                                                                Icons
                                                                    .shopping_cart,
                                                                size: 25,
                                                                color:
                                                                    greenColor,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .shopping_cart_outlined,
                                                                size: 20,
                                                                color:
                                                                    Colors.grey,
                                                              ))),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 105,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              _item.price,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              '\$50',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 9),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryIcon(String iconImage, String label, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(70)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(
                height: 40,
                width: 40,
                image: AssetImage(iconImage),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: TextStyle(
                    color: blackColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
