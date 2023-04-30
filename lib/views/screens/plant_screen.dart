import 'package:eplant/constants.dart';
import 'package:eplant/model/product.dart';
import 'package:eplant/views/screens/main_screen.dart';
import 'package:eplant/views/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlantScreen extends StatelessWidget {
  PlantScreen({super.key});

  Rx<List<Product>> products = Rx([
    Product(
        productId: 'idjfidjfiejifjeijfiejfiejf',
        catogery: Catogery.Plant,
        name: 'Bule face',
        imgUrl:
            'https://img.freepik.com/premium-vector/set-watercolor-illustrations-blue-flowers-plants-white-background_508613-315.jpg',
        description: 'Bule face is a species of flower in many countries...',
        price: '\$12'),
    Product(
        productId: 'eefjiejfiejij3ujr3urfjeifjidjfisj',
        catogery: Catogery.Plant,
        name: 'Accacia',
        imgUrl: 'https://m.media-amazon.com/images/I/61MNGrjDTNS._SX466_.jpg',
        description: 'Accacia is  a species of flower in many countreis...',
        price: '\$20'),
    Product(
        productId: 'dijidjfijeifjesdfeefifjiejfijef',
        catogery: Catogery.Plant,
        description: 'Monste is a species of flower in many countries...',
        imgUrl:
            'https://www.ikea.com/in/en/images/products/fejka-artificial-potted-plant-with-pot-in-outdoor-succulent__0614211_pe686835_s5.jpg?f=s',
        name: 'Monste',
        price: '\$30')
  ]);
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
          'Plants',
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
      body: Obx(
        () => ListView.builder(
          itemCount: products.value.length,
          itemBuilder: (
            context,
            index,
          ) {
            Product item = products.value[index];
            String itemId = products.value[index].productId;
            return customCard(context, itemId, item);
          },
        ),
      ),
    );
  }
}
