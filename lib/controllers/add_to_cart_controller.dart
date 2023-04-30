import 'package:eplant/model/product.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  static AddToCartController instance = Get.find();
  Rx<List<String>> addedItemsId = Rx<List<String>>([]);
  Rx<List<Product>> addedItems = Rx<List<Product>>([]);
  Rx<int> itemCount = Rx<int>(0);

  cartfunction(Product item, String itemId) {
    if (addedItemsId.value.contains(itemId)) {
      removeFromCart(item, itemId);
    } else {
      addToCart(item, itemId);
    }
  }

  addToCart(Product item, String itemId) {
    addedItemsId.value.add(itemId);

    addedItems.value.add(item);

    itemCount.value++;
  }

  removeFromCart(Product item, String itemId) {
    addedItemsId.value.remove(itemId);
    addedItems.value.remove(item);
    itemCount.value--;
  }
}
