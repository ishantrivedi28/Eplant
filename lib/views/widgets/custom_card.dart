import 'package:eplant/constants.dart';
import 'package:eplant/controllers/add_to_cart_controller.dart';
import 'package:eplant/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customCard(BuildContext context, String itemId, Product item) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(color: Colors.white),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  //favourite container
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
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
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                item.description,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(25, 25), backgroundColor: greenColor),
                    onPressed: () {},
                    child: Text(
                      'Details',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GetBuilder<AddToCartController>(
                    builder: (controller) {
                      return GestureDetector(
                          onTap: () {
                            AddToCartController.instance
                                .cartfunction(item, itemId);

                            AddToCartController.instance.update();
                          },
                          child: controller.addedItemsId.value.contains(itemId)
                              ? Icon(
                                  Icons.shopping_cart,
                                  size: 25,
                                  color: greenColor,
                                )
                              : Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    item.price, //
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.width / 2.5,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(item.imgUrl),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
