import 'package:eplant/constants.dart';
import 'package:eplant/model/product.dart';
import 'package:eplant/views/screens/main_screen.dart';
import 'package:eplant/views/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotScreen extends StatelessWidget {
  PotScreen({super.key});
  Rx<List<Product>> products = Rx([
    Product(
        productId: 'difjiejfiejfiejifjef',
        catogery: Catogery.Pot,
        name: 'Stone pot',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWjEf94eA4pcuHZNIztdkDUWF0AHBkBeDA7UtsJltoCzBa00aaU18dNdqa6YJuNEw21Eo&usqp=CAU',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id.',
        price: '\$8.0'),
    Product(
        productId: 'idjfijernenfdijsijdf',
        catogery: Catogery.Pot,
        name: 'Ceramic pot',
        imgUrl:
            'https://5.imimg.com/data5/SELLER/Default/2022/9/TA/WI/CD/39859897/02-2--250x250.jpg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id.',
        price: '\$12'),
    Product(
        productId: 'difidjfisjodjfiejfojwf',
        catogery: Catogery.Pot,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. AeneaPot',
        imgUrl:
            'https://m.media-amazon.com/images/I/41DR6cfg7dL._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg',
        name: 'Handmade',
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
          'Pot',
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
            Product _item = products.value[index];
            String _itemId = products.value[index].productId;

            return customCard(context, _itemId, _item);
          },
        ),
      ),
    );
  }
}
