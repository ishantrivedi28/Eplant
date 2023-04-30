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
        body: GetBuilder<AddToCartController>(
          builder: (controller) => ListView.builder(
            itemCount: AddToCartController.instance.addedItemsId.value.length,
            itemBuilder: (context, index) {
              Product items = controller.addedItems.value[index];
              String itemId = controller.addedItemsId.value[index];
              return customCard(context, itemId, items);
            },
          ),
        ));
  }
}
