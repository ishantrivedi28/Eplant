import 'package:eplant/constants.dart';
import 'package:eplant/controllers/add_to_cart_controller.dart';
import 'package:eplant/model/product.dart';
import 'package:eplant/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Cart',
            style: TextStyle(color: blackColor),
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: AddToCartController.instance.itemCount.value,
            itemBuilder: (context, index) {
              Product items =
                  AddToCartController.instance.addedItems.value[index];
              String itemId =
                  AddToCartController.instance.addedItemsId.value[index];
              return customCard(context, itemId, items);
            },
          ),
        ));
  }
}
