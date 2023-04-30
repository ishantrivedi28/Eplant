import 'package:eplant/model/product.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  static AddToCartController instance = Get.find();
  Rx<List<String>> addedItemsId = Rx<List<String>>([]);
  Rx<List<Product>> addedItems = Rx<List<Product>>([]);
  Rx<int> itemCount = Rx<int>(0);

  cartfunction(Product item, String itemId) {
    if (addedItemsId.value.contains(itemId)) {
      print('inside remove');
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
    int index = 0;
    for (var x in addedItems.value) {
      if (x.productId == itemId) {
        print('inside if, index value is');
        print(index);
        break;
      }
      index++;
    }
    addedItemsId.value.remove(itemId);

    addedItems.value.removeAt(index);
    itemCount.value--;
  }
}
